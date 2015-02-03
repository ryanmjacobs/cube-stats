/**
 * @file    main.c
 * @author  Ryan Jacobs <ryan.mjacobs@gmail.com>
 * @date    February 02, 2015
 * @bug     No known bugs.
 */

#include "cube/cube.h"

int main(int argc, char **argv) {
    cube_t *cube = cube_init();

    cube_free(cube);
    return 0;
}
