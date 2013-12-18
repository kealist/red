Red-System-Extension-Generator
=========================

This is a project in Red/System to parse a C header file corresponding to a DLL and generate a basic framework for creating a Red/System extension.

Current functionality is that it can parse functions in a header and return the equivalent library definition in Red/System.  An example from the GNU Linear Programming Kit C header file:

    void glp_set_mat_row(glp_prob *lp, int i, int len, const int ind[],const double val[]);

The script will return the following:

    glp-set-mat-row: "glp_set_mat_row" [
        lp      [pointer! [glp_prob!]]
        i       [integer!]
        len     [integer!]
        ind     [integer!]
        val     [double!]
        return  ["void"]
    ]


##To-do List

[x]Function declaration
[x]#define
[x]Parameter Pointers 
[ ]#typedef rule
[ ]Dynamic type handling
