Dokumentation
=============

Abarbeitungsreihenfolge
-----------------------
Nach dem Öffnen einer Anwendung, dem Anlegen der Base und dem Anlegen weiterer Childs laufen alle Pfade auf die Action zu, die schließlich wieder mit dem Backend kommuniziert, um die Manipulation der Daten zu ermöglichen. Nicht jedes Komponentenobjekt kann einem anderen beliebig zugeordnet werden. Das Frontend arbeitet die einzelnen Objekte nur in einer festen Reihenfolge ab.

Diese Übersicht stellt den Prozess dieser Abarbeitung dar.

.. mermaid::
   :align: center

   flowchart TD;
      AppBase-->View;
      View-->Action;
      View-->Dialog;
      Dialog -->Widget;
      Widget-->Action;
      Widget-->Sub-Dialog;
      Sub-Dialog-->Sub-Widget;
      Sub-Widget-->Action;

   subgraph AppBase;
      App-->Base;
   end   

   subgraph Dialog;
      First-Dialog-->Tabbed-Dialog;
   end

   subgraph Sub-Dialog;
      First-Sub-Dialog-->Tabbed-Sub-Dialog;
   end

   subgraph Widget;
      First-Widget-->Stacked-Widget;
   end

   subgraph Sub-Widget;
      First-Sub-Widget-->Stacked-Sub-Widget;
   end

.. toctree::
   :hidden:
   :maxdepth: 1
   
   decore
   fields