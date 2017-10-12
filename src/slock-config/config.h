/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#002B36",   /* after initialization */
	[INPUT] =  "#B58900",   /* during input */
	[FAILED] = "#DC322F",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
