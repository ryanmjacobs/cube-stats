/**
 * @file    cube.c
 * @author  Ryan Jacobs <ryan.mjacobs@gmail.com>
 * @date    February 02, 2015
 * @bug     No known bugs.
 */

#include "cube.h"
#include <stdlib.h>
#include <assert.h>
#include <ncurses.h>

cube_t *cube_init(void) {
    cube_t *cube = (cube_t *) malloc(sizeof(cube_t));
    assert(cube != NULL);

    /* create ncurses screen */
    initscr();
    start_color();
    raw();
    noecho();
    cbreak();

    /* ncurses colors */
    init_pair(0, COLOR_WHITE, COLOR_BLACK);
    init_pair(1, COLOR_BLACK, COLOR_RED);
    init_pair(2, COLOR_BLACK, COLOR_WHITE);
    init_pair(3, COLOR_BLACK, COLOR_MAGENTA);
    init_pair(4, COLOR_BLACK, COLOR_BLUE);
    init_pair(5, COLOR_BLACK, COLOR_GREEN);
    init_pair(6, COLOR_BLACK, COLOR_YELLOW);
    init_pair(7, COLOR_BLACK, COLOR_CYAN);

    return cube;
}

void cube_free(cube_t *cube) {
    endwin();
    free(cube);
}
