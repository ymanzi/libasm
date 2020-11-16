/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_libasm_bonus.h                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ymanzi <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/10/17 17:57:27 by ymanzi            #+#    #+#             */
/*   Updated: 2020/10/17 17:57:32 by ymanzi           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#	ifndef FT_LIBASM_BONUS_H
#	define FT_LIBASM_BONUS_H

#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

# define RESET   "\033[0m"
# define RED     "\033[31m"
# define GREEN   "\033[32m"
# define BUFFER_SIZE 512

typedef struct	s_list
{
	void 			*data;
	struct s_list 	*next;
} 				t_list;

ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(char *dst, const char *src);
size_t	ft_strlen(const char *s);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
char	*ft_strdup(const char *s1);

int		ft_list_size(t_list *lst);
int		ft_list_push_front(t_list **begin_list, void *data);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
int		ft_atoi_base(char *str, char *base);

#	endif
