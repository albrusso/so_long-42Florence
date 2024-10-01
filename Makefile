# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: albrusso <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/12 04:53:41 by albrusso          #+#    #+#              #
#    Updated: 2024/10/01 15:35:49 by albrusso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#                                  CONFIG                                      #
################################################################################

NAME	=	so_long
CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror
MLXFLAG	=	minilibx-linux/libmlx.a -lX11 -lXext -lm
LIBFT	=	libft/libft.a
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

SRC		=	source/main.c        \
			source/check_utils.c \
			source/check.c       \
			source/hook.c        \
			source/maps.c        \
			source/move.c        \
			source/sprite.c      \
			source/utils.c

OBJ		=	$(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

################################################################################
#                                   MAKE                                       #
################################################################################

all:	$(NAME)
$(NAME): $(OBJ)
	@make -sC libft
	@$(CC) $(CFLAGS) $(OBJ)  $(LIBFT) -o $(NAME) $(MLXFLAG)

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	@printf "$(WHITE)%s$(BLUE)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Compiling... " "$<" "[OK]"
	@$(CC) $(CFLAGS) -Imlx -c $< -o $@

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(OBJ_DIR)/source

clean:
	@make clean -sC libft
	@for file in $(OBJ); do \
		printf "$(WHITE)%s$(YELLOW)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Removing...  " "$$file" "[OK]"; \
	done
	@rm -f $(OBJ)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@printf "$(WHITE)%s$(RED)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Removing...  " "$(NAME)" "[OK]"
	@rm -f $(NAME)
	@printf "$(WHITE)%s$(RED)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Removing...  " "libft.a" "[OK]"
	@rm -f $(LIBFT)

re: fclean all

run: $(NAME)
	./$(NAME)

mem: $(NAME)
		@valgrind --quiet --leak-check=full ./$(NAME) map/map1.ber

.PHONY: all clean fclean re run mem