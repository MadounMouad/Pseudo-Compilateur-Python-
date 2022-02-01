/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     T_newline = 258,
     T_eof = 259,
     T_semi_colon = 260,
     T_Lacco = 261,
     T_Racco = 262,
     T_eq = 263,
     T_comma = 264,
     T_plus_eq = 265,
     T_minus_eq = 266,
     T_star_eq = 267,
     T_div_eq = 268,
     T_mod_eq = 269,
     T_while = 270,
     T_break = 271,
     T_continue = 272,
     T_return = 273,
     T_star = 274,
     T_Lparan = 275,
     T_Rparan = 276,
     T_dot = 277,
     T_if = 278,
     T_colon = 279,
     T_elif = 280,
     T_else = 281,
     T_for = 282,
     T_in = 283,
     T_or = 284,
     T_and = 285,
     T_lt = 286,
     T_gt = 287,
     T_deq = 288,
     T_ge = 289,
     T_le = 290,
     T_noteq = 291,
     T_notin = 292,
     T_from = 293,
     T_with = 294,
     T_to = 295,
     T_plus = 296,
     T_minus = 297,
     T_divide = 298,
     T_mod = 299,
     T_double_divide = 300,
     T_tilde = 301,
     T_double_star = 302,
     T_squarebleft = 303,
     T_squarebright = 304,
     T_none = 305,
     T_true = 306,
     T_false = 307,
     T_def = 308,
     T_name = 309,
     T_number = 310,
     T_string = 311
   };
#endif
/* Tokens.  */
#define T_newline 258
#define T_eof 259
#define T_semi_colon 260
#define T_Lacco 261
#define T_Racco 262
#define T_eq 263
#define T_comma 264
#define T_plus_eq 265
#define T_minus_eq 266
#define T_star_eq 267
#define T_div_eq 268
#define T_mod_eq 269
#define T_while 270
#define T_break 271
#define T_continue 272
#define T_return 273
#define T_star 274
#define T_Lparan 275
#define T_Rparan 276
#define T_dot 277
#define T_if 278
#define T_colon 279
#define T_elif 280
#define T_else 281
#define T_for 282
#define T_in 283
#define T_or 284
#define T_and 285
#define T_lt 286
#define T_gt 287
#define T_deq 288
#define T_ge 289
#define T_le 290
#define T_noteq 291
#define T_notin 292
#define T_from 293
#define T_with 294
#define T_to 295
#define T_plus 296
#define T_minus 297
#define T_divide 298
#define T_mod 299
#define T_double_divide 300
#define T_tilde 301
#define T_double_star 302
#define T_squarebleft 303
#define T_squarebright 304
#define T_none 305
#define T_true 306
#define T_false 307
#define T_def 308
#define T_name 309
#define T_number 310
#define T_string 311




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 21 "prog.y"
{ char VarName[20]; int Num;char* String_Value;}
/* Line 1529 of yacc.c.  */
#line 163 "prog.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

