Common Lisp Soft, Packaged for Homebrew
=======================================

Programs included into the tap
------------------------------

- ``cl-repl``: beginner-friendly REPL for Common Lisp with rich functionalities, such as IPython for Python. Packaged in `this repository <https://github.com/svetlyak40wt/homebrew-cl-repl>`_.
- ``cl-brewer``: utility helping to create Homebrew formulas for software written in Common Lisp.
- ``resume``: DSL driven CV generator. As an example of it's output you can open my CV hosted at https://svetlyak.ru/.
- ``test-brew-app``: a simple hello world to test cl-brewer.

How to install these programs?
------------------------------

Tell Homebrew to use this tap:

.. code:: bash

   brew tap 40ants/soft

then install any program from the tap as usual. For example:

.. code:: bash

   brew install cl-repl

How to package you own Common Lisp software for OSX?
----------------------------------------------------

Use `CL-Brewer <https://40ants.com/cl-brewer/>`_ to generate a formula for your ASDF system. Then publish it in a ``tap``.
