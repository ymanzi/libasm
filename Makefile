# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ymanzi <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/09 14:05:13 by ymanzi            #+#    #+#              #
#    Updated: 2020/10/15 12:54:07 by ymanzi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
ASFLAGS = -f macho64
SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_read.s ft_write.s ft_strdup.s \
ft_check_base.s ft_is_in_str.s ft_issign.s ft_isspace.s
SRCS_B = ft_atoi_base_bonus.s ft_list_push_front_bonus.s ft_list_size_bonus.s \
ft_list_sort_bonus.s ft_list_remove_if_bonus.s
AS = nasm
OBJ = $(SRCS:.s=.o)
OBJ_B = $(SRCS_B:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)
#%.o: %.asm
#	$(CC) $(CFLAGS) $< -o $@
link:
	ld -lSystem hello.o -o hello && ./hello

bonus: all $(OBJ_B)
	ar rc $(NAME) $(OBJ_B)
clean:
		rm -f $(OBJ) $(OBJ_B)
fclean: clean
		rm -f $(NAME)
re: fclean all
