Dokumentation
=============
Um mit decore Base eine lauffähige GUI-Dashboard-Anwendung zu erstellen, sind vergleichsweise wenige Schritte notwendig. Im Wesentlichen besteht der Aufbau aus der Definition der Meta-Instanzen und der Definition des Datenmodells. Die Metadaten werden vom Interpreter durch Einlesen von dekorierten Funktionen zusammengestellt und als Instanzen im Pool gespeichert.

Beschreibung der Meta-Instanzen
-------------------------------
Meta-Instanzen entahlten die benötigten Typen und Attribute für die Erstellung der GUI-Elemente. Die Meta-Instanzen werden in der Regel durch dekorierte Funktionen erstellt.

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

**Darstellung im Frontend**
   - Die Ansicht wird in der Navigation unter der Basis gelistet.
   - Die Ansicht wird im Ansichtsbereich der Basis gerendert.

Dialog
~~~~~~
Die Dialog-Instanz liefert die Metadaten für den Dialog. Ihr können weitere Dialoge untergeordnet werden die dann in Tabs dargetellt werden. Hauptsächlich dienen diese aber zum tragen der Widgets. Die Dialog-Instanz wird durch den "Decorator" :meth:`dialog() <decore_Base.decore_base.decore.Decore.dialog>` erstellt.

**Darstellung im Frontend**
   - Der Dialog kann in unterschiedlichen Display-Modis dargestellt werden. Zum Beispiel als Side-Drawer oder als modales Fenster.
   - Dieser wird durch die mit dem Aktivator-Attribut bestimmten Postionen oder Ereignisse aufgerufen.

Widget
~~~~~~
Die Widget-Instanz liefert die Metadaten für das Widget. Ihr können weitere Widgets untergeordnet werden die dann gestapelt dargetellt werden. Ein Widget wird für die Manipulation des Datensatzes oder Datensätze benötigt. Die Widget-Instanz wird durch den "Decorator" :meth:`widget() <decore_Base.decore_base.decore.Decore.widget>` erstellt.

**Darstellung im Frontend**
   - Das Widget wird im Content-Bereich des Dialoges dargestellt.

Action
~~~~~~
Die Action-Instanz liefert die Metadaten für die Aktion. Sie ist das Schlußlicht in der Prozesskette der Meta-Abarbeitung und dient zum übermitteln der Manipulationen und der Ausführung von Aktionen im Backend. Die Action-Instanz wird durch den "Decorator" :meth:`action() <decore_Base.decore_base.decore.Decore.action>` erstellt.

**Darstellung im Frontend**
   - Aktionen können durch das Aktivator-Attribut an unterschiedlichen Stellen im Frontend positioniert werden, haben aber keine tatächliche Darstellung sondern nur Schaltflächen- oder Ereignisgesteuerte Trigger.

Function
~~~~~~~~
Die Function-Instanz liefert die Metadaten für Funktionen die nach dem Init des Pools direkt in der Base als Instanz-Methoden ausgeführt werden. Die Function-Instanz wird durch den "Decorator" :meth:`function() <decore_Base.decore_base.decore.Decore.function>` erstellt.

**Darstellung im Frontend**
   - Funktionen werden nicht im Frontend dargestellt oder aufgearbeitet.

Abarbeitungsreihenfolge im Frontend
-----------------------------------
Nach dem Öffnen einer Anwendung, dem Anlegen der Base und dem Anlegen weiterer Childs laufen alle Pfade auf die Action zu, die schließlich wieder mit dem Backend kommuniziert, um die Manipulation der Daten zu ermöglichen. Nicht jedes Komponentenobjekt kann einem anderen beliebig zugeordnet werden. Das Frontend arbeitet die einzelnen Objekte nur in einer festen Reihenfolge ab.

Diese Übersicht stellt den Prozess dieser Abarbeitung dar.

.. mermaid::
   :align: center

   flowchart TD;
      App-->Base;
      App-->Dialog;
      Base-->View;
      View-->Action;
      View-->Dialog;
      Dialog -->Widget;
      Widget-->Action;
      Widget-->Sub-Dialog;
      Sub-Dialog-->Sub-Widget;
      Sub-Widget-->Action;

   subgraph Widget;
      First-Widget-->Stacked-Widget;
   end

   subgraph Sub-Widget;
      First-Sub-Widget-->Stacked-Sub-Widget;
   end

Relationale Datenverarbeitung im Widget
---------------------------------------
Die Datenverarbeitung und Datensatzgenerierung in den Widgets ist ein wichtiger Bestandteil der Anwendung und wird hier als Relationale-Datenverarbeitung bezeichnet. Diese Generierung des bearbeitbaren Datensatzes, wird erstens durch den Aktivator und zweitens durch die Datenquelle der Ansicht in Beziehung zur Datenquelle des Widgets gesteuert. Damit wird ermöglicht, einen Dialog mit weiter im Kontext der eigentlichen Selektion zu erweitern und detailreicher zu gestalten.

Folgender Chart beschreibt diesen Prozess.

Legende:
   - **Item**
      - empty = ein leerer Datensatz wird generiert. (keine Default-Werte).
      - first = der erste Datensatz der Widget-Quelle wird als Datensatz geladen.
      - last = der letzte Datensatz der Widget-Quelle wird als Datensatz geladen.
      - default = ein neuer Datensatz mit Default-Werten der Widget-Quelle wird als Datensatz geladen.
      - item_by_id = ein Datensatz mit einer definierten ID aus der Widget-Quelle wird als Datensatz geladen.

   - **Query**
      - True = Alle vorkommenden Backref-Namen und die ID des selektierten Datensatzes der Ansichts-Quelle wird genutzt, um die Query des Widgets zu erweitern.
      - False = Die ID des selektierten Datensatzes wird nicht als Query-Attribut für den Datenabruf verwendet.

   - **Extend**
      - True = automatische Befüllung der relationalen Felder des Ziel-Datensatzes, mit dem Ansichts-Datensatz. Zum Beispiel: Ein ForeignKey-Feld des Ziel-Datanstaz wird mit dem Ansichst-Datenstaz befüllt.
      - False = keine automatische Befüllung des Datensatzes.


.. mermaid::
   :align: center
   
   flowchart LR;
      Dialog --> Activator{activator}
      
      Activator -->|empty| B1{Source}
      B1 --> |== view source| R1[Item: empty\nQuery: None\nExtend: False]
      B1 --> |!= view source| R2[Item: empty\nQuery: None\nExtend: False]
      
      Activator -->|first| B2{Source}
      B2 --> |== view source| R3[Item: first\nQuery: False\nExtend: False]
      B2 --> |!= view source| R4[Item: first\nQuery: True\nExtend: True]

      Activator -->|last| B3{Source}
      B3 --> |== view source| R5[Item: last\nQuery: False\nExtend: False]
      B3 --> |!= view source| R6[Item: last\nQuery: True\nExtend: True]

      Activator -->|default| B4{Source}
      B4 --> |== view source| R7[Item: default\nQuery: False\nExtend: False]
      B4 --> |!= view source| R8[Item: default\nQuery: True\nExtend: True]

      Activator -->|click| B5{Source}
      B5 --> |== view source| R9[Item: item_by_id\nQuery: False\nExtend: False]
      B5 --> |!= view source| R10[Item: last\nQuery: True\nExtend: True]

      Activator -->|context| B6{Source}
      B6 --> |== view source| R11[Item: item_by_id\nQuery: False\nExtend: False]
      B6 --> |!= view source| R12[Item: last\nQuery: True\nExtend: True]

.. toctree::
   :glob:
   :hidden:
   :maxdepth: 1
   
   documentation/getstarted
   documentation/decore
   documentation/fields