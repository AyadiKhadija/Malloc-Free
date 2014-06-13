#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mle-roy <mle-roy@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/04/20 23:19:08 by mle-roy           #+#    #+#              #
#    Updated: 2014/04/24 17:00:23 by mle-roy          ###   ########.fr        #
#                                                                              #
#******************************************************************************#

ifeq ($(HOSTTYPE),)
        HOSTTYPE := $(shell uname -m)_$(shell uname -s)
    endif

SHELL := tcsh

NAME := $(shell echo libft_malloc_$$HOSTTYPE.so)

SRC = malloc.c mem_init.c free.c free_large.c realloc.c

FLAGS = -Wall -Wextra -Werror

$(NAME):
	gcc $(FLAGS) -shared -o $(NAME) $(SRC) -I .
	ln -s $(NAME) libft_malloc.so

clean:
	rm -f $(SRC:.c=.o)

fclean: clean
	rm -f $(NAME)
	rm -f libft_malloc.so

re: fclean all
