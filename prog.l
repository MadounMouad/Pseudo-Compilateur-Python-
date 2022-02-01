%{
#include <stdio.h>
#include <stdlib.h>
#include "prog.tab.h"
#include <string.h>

%}


%option noyywrap 
%option yylineno 
letter [A-Za-z]
digit [0-9]
%%

"#"[^\n]*  {printf("This is a comment\n");yylineno++;}

["\n"]+  {return T_newline;}

[\t]* {}

<<EOF>>                             {yyterminate();return T_eof;}
                                 
";"                                 {return T_semi_colon;}
"="                                 {return T_eq;}
","                                 {return T_comma;}
"+="                                {return T_plus_eq;}
"-="                                {return T_minus_eq;}
"*="                                {return T_star_eq;}
"/="                                {return T_div_eq;}
"%="                                {return T_mod_eq;}
"break"                             {return T_break;}
"from"                              {return T_from;}
"with"                              {return T_with;}
"to"                              {return T_to;}
"continue"                          {return T_continue;}
"return"                            {return T_return;}
"*"                                 {return T_star;}
"("                                 {return T_Lparan;}
")"                                 {return T_Rparan;}
"{"                                 {return T_Lacco;}
"}"                                 {return T_Racco;}
"if"                                {return T_if;}
"while"                             {return T_while;}
":"                                 {return T_colon;}
"elif"                              {return T_elif;}
"else"                              {return T_else;}
"for"                               {return T_for;}
"or"                                {return T_or;}
"and"                               { return T_and;}
"<"                                 {return T_lt;}
">"                                 {return T_gt;}
"=="                                {return T_deq;}
">="                                {return T_ge;}
"<="                                {return T_le;}
"!="                                {return T_noteq;}
"+"                                 {return T_plus;}
"-"                                 {return T_minus;}
"/"                                 {return T_divide;}
"%"                                 {return T_mod;}
"//"                                {return T_double_divide;}
"**"                                {return T_double_star;}
"["                                 {return T_squarebleft;}
"]"                                 {return T_squarebright;}
"None"                              {return T_none;}
"True"                              {return T_true;}
"False"                             {return T_false;}
"def"                               {return T_def;}
" "+                                {}

({letter}|_)({letter}|_|{digit})*   {strcpy(yylval.VarName,yytext);  return T_name;}
{digit}+                            {yylval.Num = atoi(yytext) ; return T_number;}
\"(.)*\"                            {yylval.String_Value = yytext ;return T_string;}
%%



 //flex prog.l   
 //gcc lex.yy.c -ll -o prog   
 // ./prog


/*
mat = [[1, 1, 1], [2, 2, 2], [1, 1, 1]]
d = {}
for l in mat:_TOKEN
    k = str(l)    # k = tuple (l) lorsque cela est possible
    if k not in d:
        d[k] = 1
    else:
        d[k] += 1
print(d)

*/
