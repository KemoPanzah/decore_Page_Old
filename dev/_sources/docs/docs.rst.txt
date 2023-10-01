Dokumentation
=============
Um mit decore Base eine lauffähige GUI-Dashboard-Anwendung zu erstellen, sind vergleichsweise wenige Schritte notwendig. Im Wesentlichen besteht der Aufbau aus der Definition der Meta-Instanzen und der Definition des Datenmodells. Die Metadaten werden vom Interpreter durch Einlesen von dekorierten Funktionen zusammengestellt und als Instanzen im Pool gespeichert.

Beschreibung der Meta-Instanzen
-------------------------------
Meta-Instanzen entahlten die benötigten Typen und Attribute für die Erstellung der GUI-Elemente. Die Meta-Instanzen werden in der Regel durch dekorierte Funktionen erstellt. Einen ersten Eindruck bekommen sie im Abschnitt :doc:`Erste Schritte<../getstarted>`

App
~~~
Die Application-Instanz liefert die Metadaten für den Anwendung. Sie ist die Wurzel für alles kommende und nimmt nur Basen auf. Die App-Instanz wird durch den "Decorator" :meth:`app() <decore_Base.decore_base.decore.Decore.app>` erstellt.

Base
~~~~
Die Base-Instanz liefert die Metadaten für die Basis. Sie ist das Trägerelement für die Ansichten. Die Base-Instanz wird durch den "Decorator" :meth:`base() <decore_Base.decore_base.decore.Decore.base>` erstellt.

**Darstellung im Frontend**
   - Die Basis ist im Grunde die freie Fläche die für die Ansichten zur Verfügung steht.
   - In der Navigation wird sie direkt unter Wurzel gelistet sobald sie mehr als eine Ansicht erhält.

View
~~~~
Die View-Instanz liefert die Metadaten für die Ansicht. Ihr können Aktionen und Dialoge untergeordnet werden. Die View-Instanz wird durch den "Decorator" :meth:`view() <decore_Base.decore_base.decore.Decore.view>` erstellt.

Die unterschiedlichen Ansichts-Typen werden im Bereich :doc:`Typen<types>` näher beschrieben.

**Darstellung im Frontend**
   - Die Ansicht wird in der Navigation unter der Basis gelistet.
   - Die Ansicht wird im Ansichtsbereich der Basis gerendert.

Dialog
~~~~~~
Die Dialog-Instanz liefert die Metadaten für den Dialog. Ihr können weiter Dialog untergeordnet werden die dann in Tabs dargetellt werden. Hauptsächlich dienen diese aber zum tragen der Widgets. Die Dialog-Instanz wird durch den "Decorator" :meth:`dialog() <decore_Base.decore_base.decore.Decore.dialog>` erstellt.

Auch hier gibt es verschiedene Dialog-Typen die im Bereich :doc:`Typen<types>` näher beschrieben werden.

**Darstellung im Frontend**
   - Der Dialog kann in unterschiedlichen Display-Modis dargestellt werden. Zum Beispiel als Side-Drawer oder als modales Fenster.
   - Dieser wird durch die mit dem Aktivator-Attribut bestimmten Postionen oder Ereignisse aufgerufen.

Widget
~~~~~~
Die Widget-Instanz liefert die Metadaten für das Widget. Ihr können weitere Widgets untergeordnet werden die dann gestapelt dargetellt werden. Ein Widget wird für die Manipulation des Datensatzes oder Datensätze benötigt. Die Widget-Instanz wird durch den "Decorator" :meth:`widget() <decore_Base.decore_base.decore.Decore.widget>` erstellt.

Widgets können beispielsweise ein Editor ein Viewer, Listen, oder Diagramme sein. Die unterschiedlichen Widget-Typen werden im Bereich :doc:`Typen<types>` näher beschrieben. 

**Darstellung im Frontend**
   - Das Widget wird im Content-Bereich des Dialoges dargestellt.

Action
~~~~~~
Die Action-Instanz liefert die Metadaten für die Aktion. Sie ist das Schlußlicht in der Prozesskette der Meta-Abarbeitung und dient zum übermitteln der Manipulationen und der Ausführung von Aktionen im Backend. Die Action-Instanz wird durch den "Decorator" :meth:`action() <decore_Base.decore_base.decore.Decore.action>` erstellt.

Auch Aktionen haben Typen die im Bereich :doc:`Typen<types>` näher beschrieben werden. Ein Besispiel wäre der Typ ``submit`` der bestimmte Daten (z.B. Item, Selektierte Items oder Strukturen) an das Backend übermittelt.

**Darstellung im Frontend**
   - Aktionen können durch das Aktivator-Attribut an unterschiedlichen Stellen im Frontend positioniert werden, haben aber keine tatächliche Darstellung sondern nur Schaltflächen- oder Ereignisgesteuerte Trigger.

Function
~~~~~~~~
Die Function-Instanz liefert die Metadaten für Funktionen die nach dem Init des Pools direkt in der Base als Instanz-Methoden ausgeführt werden. Die Function-Instanz wird durch den "Decorator" :meth:`function() <decore_Base.decore_base.decore.Decore.function>` erstellt.

**Darstellung im Frontend**
   - Funktionen werden nicht im Frontend dargestellt oder aufgearbeitet.

Abarbeitungsreihenfolge
-----------------------
Nach dem Öffnen einer Anwendung, dem Anlegen der Base und dem Anlegen weiterer Childs laufen alle Pfade auf die Action zu, die schließlich wieder mit dem Backend kommuniziert, um die Manipulation der Daten zu ermöglichen. Nicht jedes Komponentenobjekt kann einem anderen beliebig zugeordnet werden. Das Frontend arbeitet die einzelnen Objekte nur in einer festen Reihenfolge ab.

Diese Übersicht stellt den Prozess dieser Abarbeitung dar.

.. mermaid::
   :align: center

   flowchart TD;
      App-->Base;
      Base-->View;
      View-->Action;
      View-->Dialog;
      Dialog -->Widget;
      Widget-->Action;
      Widget-->Sub-Dialog;
      Sub-Dialog-->Sub-Widget;
      Sub-Widget-->Action;

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
   types