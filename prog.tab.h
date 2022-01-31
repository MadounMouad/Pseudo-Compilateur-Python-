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
     T_name = 258,
     T_number = 259,
     T_string = 260,
     T_newline = 261,
     T_eof = 262,
     T_semi_colon = 263,
     T_Lacco = 264,
     T_Racco = 265,
     T_eq = 266,
     T_comma = 267,
     T_plus_eq = 268,
     T_minus_eq = 269,
     T_star_eq = 270,
     T_div_eq = 271,
     T_mod_eq = 272,
     T_while = 273,
     T_break = 274,
     T_continue = 275,
     T_return = 276,
     T_star = 277,
     T_Lparan = 278,
     T_Rparan = 279,
     T_dot = 280,
     T_if = 281,
     T_colon = 282,
     T_elif = 283,
     T_else = 284,
     T_for = 285,
     T_in = 286,
     T_or = 287,
     T_and = 288,
     T_lt = 289,
     T_gt = 290,
     T_deq = 291,
     T_ge = 292,
     T_le = 293,
     T_noteq = 294,
     T_notin = 295,
     T_from = 296,
     T_with = 297,
     T_to = 298,
     T_plus = 299,
     T_minus = 300,
     T_divide = 301,
     T_mod = 302,
     T_double_divide = 303,
     T_tilde = 304,
     T_double_star = 305,
     T_squarebleft = 306,
     T_squarebright = 307,
     T_none = 308,
     T_true = 309,
     T_false = 310,
     T_def = 311
   };
#endif
/* Tokens.  */
#define T_name 258
#define T_number 259
#define T_string 260
#define T_newline 261
#define T_eof 262
#define T_semi_colon 263
#define T_Lacco 264
#define T_Racco 265
#define T_eq 266
#define T_comma 267
#define T_plus_eq 268
#define T_minus_eq 269
#define T_star_eq 270
#define T_div_eq 271
#define T_mod_eq 272
#define T_while 273
#define T_break 274
#define T_continue 275
#define T_return 276
#define T_star 277
#define T_Lparan 278
#define T_Rparan 279
#define T_dot 280
#define T_if 281
#define T_colon 282
#define T_elif 283
#define T_else 284
#define T_for 285
#define T_in 286
#define T_or 287
#define T_and 288
#define T_lt 289
#define T_gt 290
#define T_deq 291
#define T_ge 292
#define T_le 293
#define T_noteq 294
#define T_notin 295
#define T_from 296
#define T_with 297
#define T_to 298
#define T_plus 299
#define T_minus 300
#define T_divide 301
#define T_mod 302
#define T_double_divide 303
#define T_tilde 304
#define T_double_star 305
#define T_squarebleft 306
#define T_squarebright 307
#define T_none 308
#define T_true 309
#define T_false 310
#define T_def 311




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

