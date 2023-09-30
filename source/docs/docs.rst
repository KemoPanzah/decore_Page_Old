Dokumentation
=============

Abarbeitungsreihenfolge
-----------------------

Diese kleine Übersicht stellt dar wie das Frontend die einzelnen Meta-Komponenten abarbeitet.

.. mermaid::

   graph LR;
    App-->Base;
    Base-->View;
    View-->Dialog;
    View-->Action;
    Dialog-->Widget;
    Widget-->Action;
    Widget-->Sub-Widget;
    Sub-Widget-->Action
    Widget-->Sub-Dialog;
    Sub-Dialog-->Widget;

.. toctree::
   :hidden:
   :maxdepth: 1
   
   decore
   fields