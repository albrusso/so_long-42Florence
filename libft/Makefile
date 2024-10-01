# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: albrusso <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/07 14:16:03 by albrusso          #+#    #+#              #
#    Updated: 2024/10/01 13:47:14 by albrusso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#                                  CONFIG                                      #
################################################################################

NAME	=	libft.a
CC		=	gcc
CFLAGS	=	-Wall -Wall -Wextra
OBJ_DIR	=	.obj
SIZE	=	30

################################################################################
#                                  COLORS                                      #
################################################################################

RED		=	\033[1;31m
YELLOW	=	\033[1;33m
BLUE	=	\033[1;34m
GREEN	=	\033[1;32m
WHITE	=	\033[1;37m
DEFAULT	=	\033[0m

################################################################################
#                                   FILES                                      #
################################################################################
SRC		=	mandatory/ft_isalnum.c         \
			mandatory/ft_isprint.c         \
			mandatory/ft_memcmp.c          \
			mandatory/ft_putchar_fd.c      \
			mandatory/ft_split.c           \
			mandatory/ft_strlcat.c         \
			mandatory/ft_strncmp.c         \
			mandatory/ft_substr.c          \
			mandatory/ft_atoi.c            \
			mandatory/ft_isalpha.c         \
			mandatory/ft_itoa.c            \
			mandatory/ft_memcpy.c          \
			mandatory/ft_putendl_fd.c      \
			mandatory/ft_strchr.c          \
			mandatory/ft_strlcpy.c         \
			mandatory/ft_strnstr.c         \
			mandatory/ft_tolower.c         \
			mandatory/ft_bzero.c           \
			mandatory/ft_isascii.c         \
			mandatory/ft_memmove.c         \
			mandatory/ft_putnbr_fd.c       \
			mandatory/ft_strdup.c          \
			mandatory/ft_strlen.c          \
			mandatory/ft_strrchr.c         \
			mandatory/ft_toupper.c         \
			mandatory/ft_calloc.c          \
			mandatory/ft_isdigit.c         \
			mandatory/ft_memchr.c          \
			mandatory/ft_memset.c          \
			mandatory/ft_putstr_fd.c       \
			mandatory/ft_strjoin.c         \
			mandatory/ft_strmapi.c         \
			mandatory/ft_strtrim.c         \
			mandatory/ft_striteri.c        \
			bonus/ft_lstadd_back.c     \
			bonus/ft_lstadd_front.c    \
			bonus/ft_lstclear.c        \
			bonus/ft_lstdelone.c       \
			bonus/ft_lstiter.c         \
			bonus/ft_lstlast.c         \
			bonus/ft_lstnew.c          \
			bonus/ft_lstsize.c

OBJ	=	$(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

################################################################################
#                                   MAKE                                       #
################################################################################

all:	$(NAME)
$(NAME): $(OBJ)
	@ar rcs $@ $^

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	@printf "$(WHITE)%s$(BLUE)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Compiling... " "$<" "[OK]"
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)/mandatory
	@mkdir -p $(OBJ_DIR)/bonus

clean:
	@for file in $(OBJ); do \
		printf "$(WHITE)%s$(YELLOW)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Removing...  " "$$file" "[OK]"; \
	done
	@rm -f $(OBJ)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@printf "$(WHITE)%s$(RED)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Removing...  " "$(NAME)" "[OK]"
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
