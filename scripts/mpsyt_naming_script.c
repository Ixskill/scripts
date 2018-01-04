#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <readline/readline.h>
#include <string.h>

#define ERASE_LINE "dprintf(2, \"%s\", \"\x1b[1k\");"

int		main(int ac, char *av[]) {
	char	dirname[4096], title[4096], full_path[4096];
	char	*home = getenv("HOME");
	size_t	home_len = strlen(home);

	/* Making sure we're in a valid situation */
	if (ac != 2) { // Only a single name needs to be input
		dprintf(2, "Need default title argument\n");
		return (1);
	} else if (home_len >= 4096 - strlen("/Music/")) { // Making sure full_path can contain the whole path to the music directory.
		dprintf(2, "Home directory too long\n");
		return (2);
	} else if (!home) {
		dprintf(2, "Please correctly setup home directory");
		return (3);
	}

	/* Going to the music directory */
	strcpy(full_path, home);
	strcpy(full_path + home_len, "/Music/");
	if (chdir(full_path) != 0) {
		perror("chdir: ");
		dprintf(1, "chdir: Shit happened\n");
		return (errno);
	}
	dprintf(1, "Now in the # %s # directory\n", full_path);

	/*
	** Get user input with readline.
	** Readline is used to have access to completion.
	*/


	/*
	** If the user didnt input anything the directory will be the
	** music directory inside the home directory.
	*/ 

	dprintf(2, "Input directory name>\n");
	while (read(0, buff, 1))
		dprintf(2, "%s\n", buff);
	if (!dirname || *dirname == '\n' || *dirname == 0) {
		free(dirname);
		dirname = strdup(full_path);
	}

	title = readline("Input title>\n");
	dprintf(1, "Default title: %s\n", av[1]);

	/*
	** If the user didnt input anything The title of the song will be
	** the title of the youtube video.
	*/

	if (!title || *title == '\n' || *title == 0) {
		free(title);
		title = strdup(av[1]);
	}

	dprintf(1, "%s/%s/%s\n", full_path, dirname, title);
	free(title);
	free(dirname);
	return (0);
}
