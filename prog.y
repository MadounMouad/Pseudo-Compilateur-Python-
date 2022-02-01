%{
#include "prog.c"
#include <stdio.h>
#include <stdlib.h>
#include "linkedlist.h"
void yyerror(const char *s);
void AddNewVar(char* VarName ,Type_ID VarType,int Varscope);
int CheckIfFound(char* VarName,Type_ID VarType,int Varscope);

int yylex();
int errorNumber = 0; 
int scope = 0;



%}


%start S
%token T_newline T_eof T_semi_colon T_Lacco T_Racco T_eq T_comma T_plus_eq T_minus_eq T_star_eq T_div_eq T_mod_eq T_while T_break T_continue T_return T_star T_Lparan T_Rparan T_dot T_if T_colon T_elif T_else T_for T_in T_or T_and T_lt T_gt T_deq T_ge T_le T_noteq T_notin T_from T_with T_to T_plus T_minus T_divide T_mod T_double_divide T_tilde T_double_star T_squarebleft T_squarebright T_none T_true T_false T_def
%union{ char VarName[20]; int Num;char* String_Value;}
%token <VarName> T_name 
%token <Num>     T_number
%token <String_Value> T_string

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


assign_stmt :T_name T_eq expression {AddNewVar($1,VAR_ID,scope);}
			 |T_name T_div_eq expression   {CheckIfFound($1,VAR_ID,scope);}
			 |T_name T_star_eq expression  {CheckIfFound($1,VAR_ID,scope);}
			 |T_name T_minus_eq expression  {CheckIfFound($1,VAR_ID,scope);}
			 |T_name T_plus_eq expression  {CheckIfFound($1,VAR_ID,scope);}
			 |T_name T_mod_eq expression   {CheckIfFound($1,VAR_ID,scope);}

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

for_stmt  : T_for T_name {AddNewVar($2,VAR_ID,scope + 1);} T_from for_atom T_to for_atom T_with for_atom T_colon  block 



for_atom: T_name { CheckIfFound($1,VAR_ID,scope);}
      | T_number

block : simple_stmt
      | T_Lacco {scope++;}file_input T_Racco{DelNode(scope);scope--;} 
      
constant : T_number
         | T_string




func_def : T_def T_name  T_Lparan args T_Rparan T_colon block {AddNewVar($2,FON_ID,scope);}
	
	

args :
     | T_name {AddNewVar($1,VAR_ID,scope + 1);} args_list  
     	
args_list :
	  | T_comma T_name {AddNewVar($2,VAR_ID,scope + 1);} args_list
	


func_call : T_name T_Lparan call_args T_Rparan {CheckIfFound($1,FON_ID,scope);}
	 

call_list :
	  |T_comma T_name call_list { CheckIfFound($2,VAR_ID,scope);}
	  |T_comma constant call_list 

call_args :
	| T_name call_list { CheckIfFound($1,VAR_ID,scope);}
	| constant call_list
	


return_stmt : T_return expression 
	        | T_return




%%

void AddNewVar(char* VarName ,Type_ID VarType,int Varscope){
	Node* i=SearchForNode(VarName); 
	if(i==NULL) AddNode(VarName,VarType,Varscope);
	else{
		if(i->type != VarType) printf("Error No.%d\nVar with the name : %s was already declaried as function or variable at line No.%d \n ",errorNumber,VarName,yylineno);
	}
}
int CheckIfFound(char* VarName,Type_ID VarType,int Varscope){
	Node* i=SearchForNode(VarName); 
	if(i == NULL){
		errorNumber++;
		printf("Error No.%d\nVar with the name :  %s   was not declaried error at line No. %d \n",errorNumber,VarName,yylineno);
		return 0;
	}
	else{
		if(i->type != VarType) printf("Error No.%d\nVar or function  with the name or  :  %s   was declaried with diffrent type error at line No. %d \n",errorNumber,VarName,yylineno);
	}
	return 1;
}
void yyerror(const char *msg)
{
	errorNumber++;
	printf("\n Error No.%d at Line %d with the message %s in statment %s\n",errorNumber,yylineno,msg,yytext);
	printf("\n-------------------ERREUR : FIN DE L'ANALYSE SYNTAXIIQUE----------------------------\n");
}

int main()
{
	//printf("Enter the Expression\n");
	AddNewVar("print",FON_ID,0);
	yyparse();
	printf("\n----variables/functions qui restent---\n");
	PrintNode();
	printf("\n-------------------FIN DE L'ANALYSE SYNTAXIIQUE/SEMANTIQUE----------------------------\n");
	return 0;
}

