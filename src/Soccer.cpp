//============================================================================
// Name        : Soccer.cpp
// Author      : Denis
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "SDL2/SDL.h"

using namespace std;

int main(int argc, char *argv[]) {
	//Start SDL
    SDL_Init( SDL_INIT_EVERYTHING );
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
	SDL_Quit();
	return 0;
}
