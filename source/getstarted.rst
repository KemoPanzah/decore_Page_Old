.. meta::
   :description: create dashbord with python fastly
   :keywords: python gui, decore, python database, python dashboard, python orm, python ui, dashboard creation, python application, ui framework, ui toolkit

.. image:: /_static/images/howtos/getstarted/article.jpg
   :class: article-image

Erste Schritte
--------------
Um die schnelle GUI-Dashboard-Erstellung, mit decore Base in Python, zu veranschaulichen werden wir nun gemeinsam eine kleine UI in Form einer Webanwendung erstellen.

Die dekorierten Funktionen dienen, in allererster Linie, der Erstellung von Metainformationen für die spätere Auswertung im Frontend der Anwendung und sind nichts, wovor man sich fürchten muss.

*Es ist wirklich einfach, bitte folgen Sie mir!*

Installation
############
Erstellen Sie zunächst ein leeres Python-Projekt in Ihrem gewünschten Verzeichnis.

Um decore Base zu installieren, führen wir den folgenden Befehl im Stammverzeichnis des Projekts aus. Verwenden wir das Terminal in vscode.

.. code-block:: python
   
   pip install decore-Base

Dies erfordert eine aktivierte Python-Umgebung! Um mehr darüber zu erfahren, besuchen Sie `Python-Umgebungen in VS Code <https://code.visualstudio.com/docs/python/environments>`_.

Vorbereitung
############
.. note::
   Um für unsere zukünftige Python GUI-Dashboard-Anwendung alles nötige an Pfaden und Einstellungen zu erhalten, müssen wir noch die Vorbereitung durchführen.

Erstellen wir nun eine neue Datei mit dem Namen **app.py** im Hauptverzeichnis des Projekts.

Um decore zu verwenden, importieren wir es zunächst in das Modul **app.py**.

.. code-block:: python
   
   from decore_base import decore

Dann verwenden wir den Befehl ``prepare``, um alle erforderlichen Hilfsdateien im Stammverzeichnis des Projekts zu erstellen.

Um nun die Anwendung tatsächlich vorzubereiten, führen wir den Befehl ``python app.py --prepare`` im Terminal aus. Der Pfad muss im Hauptverzeichnis des Projekts liegen, also dort wo sich die **app.py** befindet.

Verwendung
##########
Damit der Python-Interpreter die zukünftigen Basisklassen verarbeiten kann, fügen wir den folgenden Import hinzu.

.. code-block:: python
   
   from bases import *

Normalerweise enthält ein Python-Hauptmodul eine Abfrage, die prüft, ob es das Hauptmodul ist, so dass wir anschließend die Funktion ``main`` aufrufen können.

Als nächstes erstellen wir eine Zeile ``if __name__ == '__main__':`` in der **app.py** Datei.

Um eine neue "decore" Anwendungsinstanz zu erstellen, benutzen wir eine mit ``@decore.app`` dekorierte ``main()`` Funktion in der **app.py** Datei, direkt unter der Zeile: ``if __name__ == '__main__':``.

.. code-block:: python
   
   from decore_base import decore
   from bases import *

   if __name__ == '__main__':
       @decore.app(title='My App')
       def main():
           pass

Model
~~~~~
In einem Modell legen wir die Datenfelder fest, die später einer Basis zugeordnet werden muss. Es dient als Datenbankschnittstelle zu den Datenbanktreibern wie SQLite, MySQL, PostgreSQL, etc.

Wir erstellen nun die Datei first_model.py im Verzeichnis **models** und fügen den folgenden Code ein:

.. warning::
   Es muss nicht für jede Basis ein Modell angelegt werden aber es muss jedes zu verwenden Modell eine Basis haben, die über die Datei **__init__.py**, importiert werden muss. Nur so werden Rellationen zwischen den Modellen auch im Frontend ausgewertet und dargestellt.

.. note::
   Um mögliche zirkuläre Importe zu vermeiden, legen wir die Modellklassen in einem eigenen Verzeichnis **models** in unserem Projektstammverzeichnis an. Das Verzeichnis **models** wurde durch den zuvor ausgeführten Befehl ``python app.py --prepare`` erstellt.

.. code-block:: python
   
   from decore_base.uniform.conform_model import *

   class First_model(Conform_model):
      firstname = CharField(verbose_name='First Name')
      lastname = CharField(verbose_name='Last Name')


.. note::
   In dem hier gezeigten Beispiel importieren wir aus der **uniform library** die Klasse Conform_model und erweitern sie um die Felder Vorname und Nachname.

   Die Modelle in **decore Base** basieren auf dem großartigen Peewee ORM. Um mehr über Peewee zu erfahren, besuchen Sie `Peewee ORM <http://docs.peewee-orm.com/en/latest/>`_.

.. warning::
   Beim Importieren ist zu beachten, dass wir alles (*) aus dem conform_model Namespace importieren, um auch die Feldklassen zu erhalten.

Base
~~~~
Die Basisklassen dienen der decore-Anwendung als Trägerelement für die View-Komponenten, pflegen das Datenmodell ein und gelten damit auch als Datenquelle für die Auswertung im Frontend des Dashboards.

Nun müssen wir ein neues Python-Modul erstellen, das z.B. eine Basisklasse enthält: **first_base.py**, im Verzeichnis **bases** in unserem Projektstammverzeichnis.
Das Verzeichnis **bases** wurde durch den zuvor ausgeführten Befehl ``python app.py --prepare`` miterzeugt.
 
.. code-block:: python

   from decore_base import decore
   from models.first_model import First_model

   @decore.base(title='First Base', icon='mdi-home', model=First_model)
   class First_base:
      pass

.. note::
   Um das zuvor erstellte Modell zu verwenden, importieren wir es in die Base-Klasse und übergeben es an den Parameter ``model``.

.. warning::
   In order for the Python interpreter to be able to process the base classes, we have to import them into the __init__.py file in the **bases** directory. The order of the individual imports also determines the order in **decore Front**.
   
   We edit the **__init__.py** file and insert the following code:

   .. code-block:: python

      from .first_base import First_base

View
~~~~
Views werden von der decore-Anwendung verwendet, um die Datensätze im Frontend der Webanwendung zu präsentieren.

Mit dem View-Decorator können wir nun eine Ansichts-Komponente erstellen und sie, unter der zuvor erstellten Basisklasse, einhängen.

Wir bearbeiten nun die Datei **first_base.py** erneut und erweitern den Code wie folgt:

.. code-block:: python
   :linenos:
   :emphasize-lines: 6-8
   
   from decore_base import decore
   from models.first_model import First_model

   @decore.base(title='First Base', icon='mdi-home', model=First_model)
   class First_base:
      @decore.view(title='First View', icon='mdi-home', type='table', fields=[First_model.firstname, First_model.lastname])
      def first_view():
         pass

Dialog
~~~~~~
Dialoge sind die unterstützenden Elemente für Widgets im Frontend der Webanwendung. Sie können Ansichten aber auch untergeordneten Widgets hinzugefügt werden und steuern die Sichtbarkeit und den Anzeigestil von Kindelementen. Dialoge erhalten auch die Kontrolle über die Sendefunktionen der Widgets.

In unserem Fall erstellen wir einen Dialog, um eine neue Person mit Vornamen und Nachnamen anzulegen.

Hier gehen wir ... wieder die Datei **first_base.py** und erweitern den Code wie folgt:

.. code-block:: python
   :linenos:
   :emphasize-lines: 8-10
   
   from decore_base import decore
   from models.first_model import First_model

   @decore.base(title='My First Base', icon='mdi-home', model=First_model)
   class First_base:
      @decore.view(title='Person', icon='mdi-account', type='table', fields=[First_model.firstname, First_model.lastname])
      def first_view():
         @decore.dialog(title='Add Person', icon='mdi-plus', type='standard', display='drawer', activator='default-menu')
         def first_dialog():
            pass

Widget
~~~~~~
Widgets sind Komponenten, mit denen wir Interaktionen mit dem einzelnen Datensatz durchführen können. Sie können nur zu Dialogen hinzugefügt werden und sind stapelbar.

Was wir jetzt brauchen, ist ein Eingabeformular, um die Daten für die neue Person einzugeben.

.. code-block:: python
   :linenos:
   :emphasize-lines: 10-12
   
   from decore_base import decore
   from models.first_model import First_model

   @decore.base(title='My First Base', icon='mdi-home', model=First_model)
   class First_base:
      @decore.view(title='Person', icon='mdi-account', type='table', fields=[First_model.firstname, First_model.lastname])
      def first_view():
         @decore.dialog(title='Add Person', icon='mdi-plus', type='standard', display='drawer', activator='default-menu')
         def first_dialog():
            @decore.widget(title='Add Person Form', icon='mdi-account', type='form', fields=[First_model.firstname, First_model.lastname])
            def first_widget():
               pass

Action
~~~~~~
Actions sind Methoden, mit das Frontend mit **decore Base** kommunizieren kann. Sie können zu View und Widgets hinzugefügt werden und sind die einzigen echten Klassenmethoden und werden direkt in der Basis aufgerufen.

Wir brauchen nun eine Aktion, um die Daten der neuen Person zu speichern und erweitern den Code in **first_base.py** wie folgt:

.. code-block:: python
   :linenos:
   :emphasize-lines: 12-19
      
      from decore_base import decore
      from models.first_model import First_model
   
      @decore.base(title='My First Base', icon='mdi-home', model=First_model)
      class First_base:
         @decore.view(title='Person', icon='mdi-account', type='table', fields=[First_model.firstname, First_model.lastname])
         def first_view():
            @decore.dialog(title='Add Person', icon='mdi-plus', type='standard', display='drawer', activator='default-menu')
            def first_dialog():
               @decore.widget(title='Add Person Form', icon='mdi-account', type='form', fields=[First_model.firstname, First_model.lastname])
               def first_widget():
                  @decore.action(title='Save Person', icon='mdi-content-save', type='submit')
                  def first_action(self, data):
                     item = First_model(item, **kwargs)
                     item.title = item.firstname + ' ' + item.lastname
                     if item.save():
                        return True, item.title + ' saved successfully'
                     else:
                        return False, 'Error while saving ' + item.title

.. note::
   Um einen Datensatz mit decore Base zu erstellen, müssen wir eine Instanz des Modells erstellen. In unserem Fall **First_model**. Die Instanz wird mit den Daten aus dem Formular gefüllt und dann gespeichert.

   Die ID, in Form einer UUID im Textformat, wird automatisch generiert und muss nicht gesondert angegeben werden.

.. warning::
   Das Feld **titel** muss bei jeder Datensatzerstellung verwendet werden. Andernfalls wird das Element die Validierung nicht bestehen. Es sollte ausserdem immer eindeutig sein, also keine gleichen Titel in der Datenbank geben.

Ausführung, Entwicklung und Erstellung
######################################
Ausführung
~~~~~~~~~~
Um Ihre Anwendung zu starten, führen Sie ``python app.py`` in Ihrem Projekt-Stammverzeichnis aus. Verwenden Sie das Terminal in vscode.

Öffnen Sie den Browser und geben Sie ``http://localhost:5555`` ein.

Entwicklung
~~~~~~~~~~~
Um Ihre Anwendung zu entwickeln, verwenden Sie Ihren Debugger mit dem Profil ``[dev] decore base development`` in vscode.

Öffnen Sie den Browser und geben Sie ``http://localhost:5555`` ein.

Erstellung
~~~~~~~~~~
Um Ihre Anwendung zu erstellen, führen Sie ``python app.py --build`` in Ihrem Projekt-Stammverzeichnis aus. Verwenden Sie das Terminal in vscode.