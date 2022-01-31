%{
#include <stdio.h>
#include <stdlib.h>
#include "prog.tab.h"

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
                                 
";"                                 {fprintf(yyout, "%s", yytext);return T_semi_colon;}
"="                                 {fprintf(yyout, "%s", yytext);printf("Matches Equal\n"); return T_eq;}
","                                 {fprintf(yyout, "%s", yytext);return T_comma;}
"+="                                {fprintf(yyout, "%s", yytext);return T_plus_eq;}
"-="                                {fprintf(yyout, "%s", yytext);return T_minus_eq;}
"*="                                {fprintf(yyout, "%s", yytext);return T_star_eq;}
"/="                                {fprintf(yyout, "%s", yytext);return T_div_eq;}
"%="                                {fprintf(yyout, "%s", yytext);return T_mod_eq;}
"break"                             {fprintf(yyout, "%s", yytext);return T_break;}
"from"                              {fprintf(yyout, "%s", yytext);return T_from;}
"with"                              {fprintf(yyout, "%s", yytext);return T_with;}
"to"                              {fprintf(yyout, "%s", yytext);return T_to;}
"continue"                          {fprintf(yyout, "%s", yytext);return T_continue;}
"return"                            {fprintf(yyout, "%s", yytext);return T_return;}
"*"                                 {fprintf(yyout, "%s", yytext);return T_star;}
"("                                 {fprintf(yyout, "%s", yytext);return T_Lparan;}
")"                                 {fprintf(yyout, "%s", yytext);return T_Rparan;}
"{"                                 {fprintf(yyout, "%s", yytext);return T_Lacco;}
"}"                                 {fprintf(yyout, "%s", yytext);return T_Racco;}
"if"                                {fprintf(yyout, "%s", yytext);printf("Matched If\n"); return T_if;}
"while"                             {fprintf(yyout, "%s", yytext);printf("Matched WHILE\n"); return T_while;}
":"                                 {fprintf(yyout, "%s", yytext);printf("Matched Colon\n"); return T_colon;}
"elif"                              {fprintf(yyout, "%s", yytext);return T_elif;}
"else"                              {fprintf(yyout, "%s", yytext);return T_else;}
"for"                               {fprintf(yyout, "%s", yytext);return T_for;}
"or"                                {fprintf(yyout, "%s", yytext);return T_or;}
"and"                               {fprintf(yyout, "%s", yytext);printf("Matched and\n"); return T_and;}
"<"                                 {fprintf(yyout, "%s", yytext);return T_lt;}
">"                                 {fprintf(yyout, "%s", yytext);return T_gt;}
"=="                                {fprintf(yyout, "%s", yytext);return T_deq;}
">="                                {fprintf(yyout, "%s", yytext);return T_ge;}
"<="                                {fprintf(yyout, "%s", yytext);return T_le;}
"!="                                {fprintf(yyout, "%s", yytext);return T_noteq;}
"+"                                 {fprintf(yyout, "%s", yytext);return T_plus;}
"-"                                 {fprintf(yyout, "%s", yytext);return T_minus;}
"/"                                 {fprintf(yyout, "%s", yytext);return T_divide;}
"%"                                 {fprintf(yyout, "%s", yytext);return T_mod;}
"//"                                {fprintf(yyout, "%s", yytext);return T_double_divide;}
"**"                                {fprintf(yyout, "%s", yytext);return T_double_star;}
"["                                 {fprintf(yyout, "%s", yytext);return T_squarebleft;}
"]"                                 {fprintf(yyout, "%s", yytext);return T_squarebright;}
"None"                              {fprintf(yyout, "%s", yytext);return T_none;}
"True"                              {fprintf(yyout, "%s", yytext);return T_true;}
"False"                             {fprintf(yyout, "%s", yytext);return T_false;}
"def"                               {fprintf(yyout, "%s", yytext);return T_def;}
" "+                                {fprintf(yyout, " ");/*Extra Whitespace*/}

({letter}|_)({letter}|_|{digit})*   {
                                        fprintf(yyout, "%s", yytext);
                                       printf("Matched : %s\n", yytext);
                                       return T_name;
                                    }
{digit}+                            {fprintf(yyout, "%s", yytext);printf("Found a number\n"); return T_number;}
\"(.)*\"                            {fprintf(yyout, "%s", yytext);return T_string;}
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
