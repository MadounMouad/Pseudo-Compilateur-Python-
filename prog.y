%{
#include "prog.c"
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();

    extern int depth;
	extern int top();
	extern int pop();
%}


%start S
%token T_name T_number T_string T_newline T_eof T_semi_colon T_Lacco T_Racco T_eq T_comma T_plus_eq T_minus_eq T_star_eq T_div_eq T_mod_eq T_while T_break T_continue T_return T_star T_Lparan T_Rparan T_dot T_if T_colon T_elif T_else T_for T_in T_or T_and T_lt T_gt T_deq T_ge T_le T_noteq T_notin T_from T_with T_to T_plus T_minus T_divide T_mod T_double_divide T_tilde T_double_star T_squarebleft T_squarebright T_none T_true T_false T_def
%right T_eq
%left T_and T_or
%left T_ge T_le T_deq T_noteq T_gt T_lt
%left T_plus T_minus
%left T_star T_divide T_mod T_double_divide 
%left T_double_star


%%

S : file_input
    | T_eof

file_input
	:   
	| T_newline file_input
	| stmt file_input


stmt : simple_stmt T_newline
	 | compound_stmt T_newline



simple_stmt :  T_break
	        | T_continue
            | assign_stmt
            | expressions 
            | return_stmt


assign_stmt :T_name aff expression 
	
aff : T_eq
    | T_div_eq
    | T_star_eq
    | T_minus_eq
    | T_plus_eq
    | T_mod_eq
    
arith_exp : atom 
          | arith_exp  T_plus  arith_exp
          | arith_exp  T_minus  arith_exp
          | arith_exp  T_star  arith_exp
          | arith_exp  T_divide  arith_exp
          | arith_exp  T_double_divide  arith_exp
	      | arith_exp  T_double_star  arith_exp
	      | arith_exp  T_mod  arith_exp
          | T_minus arith_exp 

	 
expression  : expression  T_or expression 
            | arith_exp T_lt arith_exp
            | expression  T_and expression 
            | arith_exp T_gt arith_exp
            | arith_exp T_le arith_exp
            | arith_exp T_ge arith_exp
	        | T_Lparan expression  T_Rparan
	        | arith_exp T_deq arith_exp
		    | arith_exp T_noteq arith_exp
		    | arith_exp
            


expressions : expression
			| expression T_comma expressions

atom : T_name
     | constant
     | T_none
	 | T_true
     | T_false
     | func_call
 

compound_stmt :  if_stmt
                | while_stmt
		        | for_stmt
                | func_def

if_stmt : T_if expression T_colon block
        | T_if expression T_colon block elif_stmts



elif_stmts : else_stmt
           |  T_elif expression T_colon block elif_stmts
	  
else_stmt : T_else T_colon block
	 
while_stmt : T_while expression T_colon block
	  
for_stmt  : T_for T_name T_from for_atom T_to for_atom T_with for_atom T_colon  block



for_atom: T_name 
      | T_number

block : simple_stmt
      | T_Lacco file_input T_Racco 
      


constant : T_number
         | T_string




func_def : T_def T_name T_Lparan args T_Rparan T_colon block
	
	

args :
     | T_name args_list
     	
args_list :
	  | T_comma T_name args_list
	


func_call : T_name T_Lparan call_args T_Rparan
	 

call_list :
	  |T_comma atom call_list
	 

call_args :
	| T_name call_list
	| constant call_list
	



return_stmt : T_return expression 
	        | T_return




%%

void yyerror(const char *msg)
{
	printf("\nSyntax Error at Line %d\n",  yylineno);
}

int main()
{
	//printf("Enter the Expression\n");
	yyparse();
	return 0;
}

