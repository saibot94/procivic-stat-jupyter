function enableForTeacher() {
    # enable creation and grading for the teacher
    jupyter nbextension enable --user formgrader/main --section=tree
    jupyter serverextension enable --user nbgrader.server_extensions.formgrader
    jupyter nbextension enable --user create_assignment/main
    nbgrader quickstart szeged-course
}

enableForTeacher