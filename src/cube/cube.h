/**
 * @file    cube.h
 * @brief   Include this file to use the Cube API.
 * @author  Ryan Jacobs <ryan.mjacobs@gmail.com>
 * @date    February 02, 2015
 * @bug     No known bugs.
 */

#ifndef CUBE_H
#define CUBE_H

typedef struct {
} cube_t;

cube_t *cube_init(void);
void cube_free(cube_t *cube);

#endif /* CUBE_H */
