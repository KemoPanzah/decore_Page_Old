��    �                    
  ~   
  0   �
  y   �
  �   7  �   �  �   o      _     �  @   �  $   �       �     4   �  ^        {  '   �     �  �   �  4   ;  	   p     z  s   �  }   �     y  �   �     u     �     �     �     �  F   �  
   1  V  <     �  .   �     �     �               3     J     a  0  h  /   �  �  �  c   t  �   �     �     �     �     �       /   8  0   h  0   �  ~   �     I  ~   �  r   H  o   �  �   +  �   �     �  �     �   �  K   �   �   �      x!     }!  �  �!  T   C#  :   �#    �#  ^   �$  n   E%  Q   �%  R   &  o   Y&  R   �&  R   '     o'     {'  T   �'  F   �'  \   &(  
   �(  �   �(    _)     l*  �   s*     �*     +  '    +     H+  1   e+  �   �+  m   ',  �   �,  u   |-  W   �-  <   J.  �   �.  �   !/  �   �/  e   �0     41  �   A1     �1  �   �1     a2  �   g2     
3    3  
   #4  J   .4     y4     �4  �   �4  �   u5  2   �5  a   /6  9   �6  [   �6  �   '7  y   �7  �   @8  �   �8     \9  �   �9  M   i:  �   �:  �   ^;  �   *<  �   �<    �=  �   �>  
   x?     �?  r   �?     �?  ]   @  ^   f@  ?   �@  �   A     �A  �   �A  `  �B  W   D     `D  g   �D  �   HE  "   �E  [  F     lG  +   �G     �G  �   �G  D   MH  ~  �H  �   J  '   �J  y   �J  �   6K  �   �K  �   nL      ^M     M  @   �M  $   �M     N  �   
N  4   �N  M   �N     IO     MO     hO  u   mO  $   �O  	   P     P  `   P  t   �P     �P  �   
Q     �Q     �Q      R     R     0R  E   HR  
   �R  S  �R     �S  0   T     >T     WT     nT     �T     �T     �T     �T    �T  -   �U  j  V  b   �W  �   �W     �X     �X     �X      Y     )Y  0   HY  .   yY  +   �Y  i   �Y  g   >Z  i   �Z  _   [  v   p[  �   �[  �   �\  o   )]  �   �]  �    ^  F   �^  �   _     �_     �_  �  �_  E   (a  *   na  �   �a  L   �b  \   �b  B   3c  ?   vc  R   �c  A   	d  A   Kd     �d     �d  @   �d  9   �d  R    e     se  �   ye  �   5f     'g  y   .g     �g     �g  $   �g  !   �g  /   h  �   Fh  _   �h  �   2i  ]   �i  O   Zj  <   �j  �   �j  �   yk  �   %l  U   m     gm  �   tm     �m  s   n     zn  �   �n     o    o  
   p  L    p     mp     tp  �   �p  �   iq  2   �q  a   #r  9   �r  [   �r  �   s  l   �s  t   't  l   �t  m   	u  |   wu  =   �u  �   2v  �   �v  �   w  �   0x  �   �x  �   �y     uz     {z  j   �z     �z  X   �z  G   P{  ?   �{  �   �{     �|  �   �|  H  @}  L   �~  n   �~  `   E  �   �  "   >�    a�     v�  +   ��     ��  �   ȁ  4   W�   **decore Base ist derzeit in Arbeit, nur lokal bereitstellbar, nur für Windows verfügbar und noch nicht produktionsbereit**. *Es ist wirklich einfach, bitte folgen Sie mir!* A List of type string. Only the speciefied fields will be displayed in the filter. If None, all fields will be displayed. A dictonary containing a query to be used when querying choices (e.g. in selection fields in the frontend). The query always refers to the reference model. A dictonary containing a query to be used when querying options (e.g. in selection fields in the frontend). The query always refers to the reference model. A field to represent a many-to-many relationship between two models. It is a MetaField and does not get a column in the database. However, a through model is created by decore Base, which represents the relationship between the two models. A field to store boolean values. A field to store char values. A field to store passwords in the keybase and to use them again. A human-readable name for the field. Action Actions sind Methoden, mit das Frontend mit **decore Base** kommunizieren kann. Sie können zu View und Widgets hinzugefügt werden und sind die einzigen echten Klassenmethoden und werden direkt in der Basis aufgerufen. Additional text to be displayed in **decore Front**. Als nächstes erstellen wir eine Zeile ``if __name__ == '__main__':`` in der **app.py** Datei. Ausführung Ausführung, Entwicklung und Erstellung Base Beim Importieren ist zu beachten, dass wir alles (*) aus dem conform_model Namespace importieren, um auch die Feldklassen zu erhalten. Bitte unterstützen Sie diese großartigen Projekte! Contents: Contribution Damit der Python-Interpreter die zukünftigen Basisklassen verarbeiten kann, fügen wir den folgenden Import hinzu. Dann verwenden wir den Befehl ``prepare``, um alle erforderlichen Hilfsdateien im Stammverzeichnis des Projekts zu erstellen. Das Datenmodell der Basis. Das Feld **titel** muss bei jeder Datensatzerstellung verwendet werden. Andernfalls wird das Element die Validierung nicht bestehen. Es sollte ausserdem immer eindeutig sein, also keine gleichen Titel in der Datenbank geben. Das Symbol der Aktion. Das Symbol der Ansicht. Das Symbol der Basis. Das Symbol des Dialogs. Das Symbol des Widgets. Datensatz-Validierung mit Cerberus (https://github.com/pyeve/cerberus) Decorators Der Aktivatortyp des Dialogs. Über den Wert ``none`` wird der Dialog sofort beim OnLoad Ereignis der View angezeigt. Der Wert ``default`` stellt den Dialog im Top-Menu der View dar. Der Wert ``context`` stellt den Dialog im Kontextmenü eines Items der View dar. Der Wert ``click`` zeigt den Dialog dann an wenn man einen Datensatz anklickt. Der Anzeigetyp des Dialogs. Der Dialog ist das Trägerelement für Widgets Der Titel der Aktion. Der Titel der Ansicht. Der Titel der App. Der Titel der Basis. Der Titel des Dialogs. Der Titel des Widgets. Dialog Dialoge sind die unterstützenden Elemente für Widgets im Frontend der Webanwendung. Sie können Ansichten aber auch untergeordneten Widgets hinzugefügt werden und steuern die Sichtbarkeit und den Anzeigestil von Kindelementen. Dialoge erhalten auch die Kontrolle über die Sendefunktionen der Widgets. Die Abfrage, die in der Ansicht angezeigt wird. Die Aktionen durchlaufen ein Modul, welches die erhaltenen Daten aufbereitet und als Keyword-Parameter an die dekorierte Funktion übergibt. Es ist alles in den ``kwargs`` zu finden und man macht sich diese einfach verfügbar. Der Parameter ``item`` ist ein Beispiel dafür und repräsentiert den vom Frontend zurückgegebenen Datensatz. Um herauszufinden, was alles noch in den ``kwargs`` steckt, bitte den Debugger benutzen. Die Basis ist das Trägerelement für die Ansicht und die Vorlage für die Datenquelle im Frontend. Die Basisklassen dienen der decore-Anwendung als Trägerelement für die View-Komponenten, pflegen das Datenmodell ein und gelten damit auch als Datenquelle für die Auswertung im Frontend des Dashboards. Die Beschreibung der Aktion. Die Beschreibung der Ansicht. Die Beschreibung der Basis. Die Beschreibung des Dialogs. Die Beschreibung des Widgets. Die Felder, die in dem Widget angezeigt werden. Die Felder, die in der Ansicht angezeigt werden. Die Filter, die in der Ansicht angezeigt werden. Die ID des übergeordneten Elements. Nur zu setzen, wenn das Widget in einem Dialog einer anderen Basis gerendert werden soll. Die ID des übergeordneten Elements. Nur zu setzen, wenn der Dialog in einer Ansicht einer anderen Basis gerendert werden soll. Die ID des übergeordneten Elements. Nur zu setzen, wenn die Aktion in einem Widget einer anderen Basis gerendert werden soll. Die ID des übergeordneten Elements. Nur zu setzen, wenn die Ansicht in einer anderen Basis gerendert werden soll. Die ID, in Form einer UUID im Textformat, wird automatisch generiert und muss nicht gesondert angegeben werden. Die Modelle in **decore Base** basieren auf dem großartigen Peewee ORM. Um mehr über Peewee zu erfahren, besuchen Sie `Peewee ORM <http://docs.peewee-orm.com/en/latest/>`_. Die dekorierten Funktionen dienen, in allererster Linie, der Erstellung von Metainformationen für die spätere Auswertung im Frontend der Anwendung und sind nichts, wovor man sich fürchten muss. Die empfohlene IDE ist Visual Studio Code und alle meine Kommentare und Dokumentationen hier beziehen sich auch nur auf vscode. Die größte Hilfe, die ich im Moment bekommen kann, ist, wenn Sie einen Blick auf das Projekt werfen und mir sagen, was Sie davon halten. Ich bin für jede Kritik dankbar. Dies erfordert eine aktivierte Python-Umgebung! Um mehr darüber zu erfahren, besuchen Sie `Python-Umgebungen in VS Code <https://code.visualstudio.com/docs/python/environments>`_. Diese Dokumentation wurde mit Deepl vom Deutschen ins Englische übersetzt. Diese Klasse stellt alle notwendigen Funktionen zur Verfügung, um eine decore Anwendung zu definieren. Sie hält auch die Routen für die Kommunikation mit dem Frontend. Docs Dokumentation Ein Widget dient zur Darstellung und Interaktion mit dem Datensatz. Es erhält die Daten, die der Dialog-Aktivator vorgibt. Der Wert ``none`` übergibt den letzten Datensatz der Datenbanktabelle. Der Wert ``default`` übergibt einen nur mit Default-Werten gefüllten Datensatz. Beim Wert ``context`` übergibt es den Datensatz, der im Kontextmenü der Ansicht ausgewählt wurde. Und ``click`` übergibt den Datensatz, der angeklickt wurde. Eine Aktion ist die tatsächliche Interaktion zwischen dem Benutzer und dem Backend. Eine Ansicht ist ein Container für die Anzeige von Daten. Eine Funktion wird direkt nach der Zusammenstellung des Metadaten-Pool ausgeführt. Mit Funktionen kann man die Logik erweitern, Dinge vorbereiten oder Hintergrundaufgaben erledigen. sie agieren als Instanzmethoden der Basis und erhalten damit den objektorientierten Ansatz. Eine Funktion zum eröffnen einer GUI-Dashboard-Anwendung. Sie wird als "Decorator" verwendet. Eine Funktion zum registrieren einer Basis in der GUI-Dashboard-Anwendung. Sie wird als "Decorator" verwendet. Eine Funktion zur Registrierung einer Aktion. Sie wird als "Decorator" verwendet. Eine Funktion zur Registrierung einer Ansicht. Sie wird als "Decorator" verwendet. Eine Funktion zur Registrierung einer Funktion in der übergeordneten Base. Sie wird als "Decorator" verwendet. Eine Funktion zur Registrierung eines Dialogs. Sie wird als "Decorator" verwendet. Eine Funktion zur Registrierung eines Widgets. Sie wird als "Decorator" verwendet. Entwicklung Erste Schritte Erstellen Sie zunächst ein leeres Python-Projekt in Ihrem gewünschten Verzeichnis. Erstellen sie GUI-Dashboard-Anwendungen in Python schnell und einfach. Erstellen wir nun eine neue Datei mit dem Namen **app.py** im Hauptverzeichnis des Projekts. Erstellung Es gibt aber auch Widgets, die mehrere Datensätze darstellen können, wie im Beispiel davor werden hier auch die Relationen verwendet, um nur Daten abzubilden, die etwas mit dem gewählten Item zu tun haben. Es muss nicht für jede Basis ein Modell angelegt werden aber es muss jedes zu verwenden Modell eine Basis haben, die über die Datei **__init__.py**, importiert werden muss. Nur so werden Rellationen zwischen den Modellen auch im Frontend ausgewertet und dargestellt. Felder Fertige SPA (Single Page Application) mit Vue.js unter Verwendung des Quasar Frameworks (https://github.com/quasarframework/quasar) Funktionen und Integrationen Get started Gib an, wie die Aktion ausgelöst wird. Gibt an was die Aktion kann. Gibt an wie das Widget die Daten darstellen wird. Gibt an wie der Dialog die Widgets darstellen wird. Der Wert ``standard`` stellt die untergeordneten Widgets und Sub-Widgets untereinander dar. Gibt an wie die Datensätze angezeigt werden. Der Wert ``table`` stellt die Datensätze in einer Tabelle dar. Gibt an wie eine Funktion ausgeführt wird. Mit dem Wert ``shot`` wird sie nur einmal ausgeführt. Der Wert ``work`` wird in einem Thread ausgeführt und kann somit Schleifen abarbeiten die niemals enden bis der Main-Thread endet. Gibt an wieviele Datensätze auf einer Seite der Ansicht angezeigt werden sollen. ``16`` ist die Standardeinstellung. Hier gehen wir ... wieder die Datei **first_base.py** und erweitern den Code wie folgt: If True, the field is allowed to be null. Defaults to False. In dem hier gezeigten Beispiel importieren wir aus der **uniform library** die Klasse Conform_model und erweitern sie um die Felder Vorname und Nachname. In einem Modell legen wir die Datenfelder fest, die später einer Basis zugeordnet werden muss. Es dient als Datenbankschnittstelle zu den Datenbanktreibern wie SQLite, MySQL, PostgreSQL, etc. In order for the Python interpreter to be able to process the base classes, we have to import them into the __init__.py file in the **bases** directory. The order of the individual imports also determines the order in **decore Front**. In unserem Fall erstellen wir einen Dialog, um eine neue Person mit Vornamen und Nachnamen anzulegen. Installation Integriertes ORM für Datenmanagement und Datenbankschnittstellen (SQLite) powered by the great Peewee (https://github.com/coleifer/peewee) Introduction Mit dem View-Decorator können wir nun eine Ansichts-Komponente erstellen und sie, unter der zuvor erstellten Basisklasse, einhängen. Model Normalerweise enthält ein Python-Hauptmodul eine Abfrage, die prüft, ob es das Hauptmodul ist, so dass wir anschließend die Funktion ``main`` aufrufen können. Notes Nun müssen wir ein neues Python-Modul erstellen, das z.B. eine Basisklasse enthält: **first_base.py**, im Verzeichnis **bases** in unserem Projektstammverzeichnis. Das Verzeichnis **bases** wurde durch den zuvor ausgeführten Befehl ``python app.py --prepare`` miterzeugt. Parameters Passwortverwaltung mit pykeepass (https://github.com/libkeepass/pykeepass) Sample Sample application The BackRefMetaField is used by the user to represent relationships in the **decore Front** application. For example, it can be assigned to the filter or to a form. It is a MetaField and does not get a column in the database. The BackRefMetaField's name must match the name of the specified backref in the ForeignKey or ManyToMany field in the reference model. The default value for the field. Defaults to None. The keybase is a KeePass file and should be protected by setting the correct access rights (ACL). The model to which the relationship is to be established. The name of the field in the reference model that represents the relationship to the model. To better understand how decore base works, it is best to look at the sample application. The application represents my continuous development of decore base. Um Ihre Anwendung zu entwickeln, verwenden Sie Ihren Debugger mit dem Profil ``[dev] decore base development`` in vscode. Um Ihre Anwendung zu erstellen, führen Sie ``python app.py --build`` in Ihrem Projekt-Stammverzeichnis aus. Verwenden Sie das Terminal in vscode. Um Ihre Anwendung zu starten, führen Sie ``python app.py`` in Ihrem Projekt-Stammverzeichnis aus. Verwenden Sie das Terminal in vscode. Um das zuvor erstellte Modell zu verwenden, importieren wir es in die Base-Klasse und übergeben es an den Parameter ``model``. Um decore Base zu installieren, führen wir den folgenden Befehl im Stammverzeichnis des Projekts aus. Verwenden wir das Terminal in vscode. Um decore zu verwenden, importieren wir es zunächst in das Modul **app.py**. Um die schnelle GUI-Dashboard-Erstellung, mit decore Base in Python, zu veranschaulichen werden wir nun gemeinsam eine kleine UI in Form einer Webanwendung erstellen. Um eine neue "decore" Anwendungsinstanz zu erstellen, benutzen wir eine mit ``@decore.app`` dekorierte ``main()`` Funktion in der **app.py** Datei, direkt unter der Zeile: ``if __name__ == '__main__':``. Um einen Datensatz mit decore Base zu erstellen, müssen wir eine Instanz des Modells erstellen. In unserem Fall **First_model**. Die Instanz wird mit den Daten aus dem Formular gefüllt und dann gespeichert. Um für unsere zukünftige Python GUI-Dashboard-Anwendung alles nötige an Pfaden und Einstellungen zu erhalten, müssen wir noch die Vorbereitung durchführen. Um mögliche zirkuläre Importe zu vermeiden, legen wir die Modellklassen in einem eigenen Verzeichnis **models** in unserem Projektstammverzeichnis an. Das Verzeichnis **models** wurde durch den zuvor ausgeführten Befehl ``python app.py --prepare`` erstellt. Um nun die Anwendung tatsächlich vorzubereiten, führen wir den Befehl ``python app.py --prepare`` im Terminal aus. Der Pfad muss im Hauptverzeichnis des Projekts liegen, also dort wo sich die **app.py** befindet. Verwendung View Views werden von der decore-Anwendung verwendet, um die Datensätze im Frontend der Webanwendung zu präsentieren. Vorbereitung Vordefinierte Webapi für Metadaten und Aktionen mit Flask (https://github.com/pallets/flask) Was wir jetzt brauchen, ist ein Eingabeformular, um die Daten für die neue Person einzugeben. We edit the **__init__.py** file and insert the following code: Wenn Sie etwas in der Dokumentation in Bezug auf Funktionen, Fehler oder Unklarheiten finden, lassen Sie es mich bitte wissen. Bitte benutzen Sie dazu den Problembereich im Repository. `<https://github.com/KemoPanzah/decore_Base/issues>`_ Widget Widgets sind Komponenten, mit denen wir Interaktionen mit dem einzelnen Datensatz durchführen können. Sie können nur zu Dialogen hinzugefügt werden und sind stapelbar. Widgets, welche aus einer fremden Basis einem Dialog zugeordnet werden, ergänzen die relationalen Felder eines Default-Items der fremden Datenquelle mit den Daten des aktivierten Items. (Der Satz ist Scheiße zu verstehen, aber er trifft genau das, was es tut). In der Sample Anwendung verwende ich das beim Zuweisen von "Contracts" zu einer "Person". Wir bearbeiten nun die Datei **first_base.py** erneut und erweitern den Code wie folgt: Wir brauchen nun eine Aktion, um die Daten der neuen Person zu speichern und erweitern den Code in **first_base.py** wie folgt: Wir erstellen nun die Datei first_model.py im Verzeichnis **models** und fügen den folgenden Code ein: Wählt die Methode wie die Datensätze der View geladen werden. Der Wert ``client`` lädt alle Datensätze auf einmal und überlässt den Seitenaufbau dem Frontend. create dashbord with python fastly decore Base ist ein out-of-the-box "Python to Vue.js" Datenanwendungs-Dashboard, das Ihnen hilft, in wenigen einfachen Schritten von der Idee zur Ansicht zu gelangen. Es richtet sich an diejenigen, die sich auf die Ergebnisse ihrer Algorithmen konzentrieren wollen, wissenschaftliche Arbeit leisten oder Lehr- und Lernfunktionen ausführen wollen. decore Base | UI fastly https://github.com/KemoPanzah/decore_Sample index, follow python gui, decore, python database, python dashboard, python orm, python ui, dashboard creation, python application, ui framework, ui toolkit Öffnen Sie den Browser und geben Sie ``http://localhost:5555`` ein. Project-Id-Version: decore Base
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-09-27 15:46+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.12.1
 **decore Base is currently a work in progress, only locally deployable, only available for Windows and not yet production ready**. *It's really simple, please follow me!* A List of type string. Only the speciefied fields will be displayed in the filter. If None, all fields will be displayed. A dictonary containing a query to be used when querying choices (e.g. in selection fields in the frontend). The query always refers to the reference model. A dictonary containing a query to be used when querying options (e.g. in selection fields in the frontend). The query always refers to the reference model. A field to represent a many-to-many relationship between two models. It is a MetaField and does not get a column in the database. However, a through model is created by decore Base, which represents the relationship between the two models. A field to store boolean values. A field to store char values. A field to store passwords in the keybase and to use them again. A human-readable name for the field. Action Actions are methods that allow the frontend to communicate with **decore Base**. They can be added to view and widgets and are the only real class methods and are called directly in Base. Additional text to be displayed in **decore Front**. Next, we create a line ``if __name__ == '__main__':`` in the **app.py** file. Run Run, development and build Base When importing, note that we import everything (*) from the conform_model namespace to get the field classes as well. Please support these great projects! Contents: Contribution To allow the Python interpreter to process the future base classes, we add the following import. Then we use the ``prepare`` command to build all the necessary auxiliary files in the root directory of the project. The Base data model. The **title** field must be used for each record creation. Otherwise the element will not pass the validation. It should also always be unique, i.e. there should be no identical titles in the database. The symbol of action. The icon of the View. The symbol of the Base. The symbol of dialogue. The icon of the widget. Data set validation with Cerberus (https://github.com/pyeve/cerberus) Decorators The activator type of the dialog. The value ``none`` displays the dialog immediately at the view's OnLoad event. The value ``default`` represents the dialog in the top menu of the view. The value ``context`` represents the dialog in the context menu of an item of the view. The value ``click`` displays the dialog when a record is clicked. The display type of the dialog. The dialog is the supporting element for widgets The title of the action. The title of the View. The title of the app. The title of the Base. The title of the dialogue. The title of the widget. Dialog Dialogs are the supporting elements for widgets in the front end of the web application. They can be added to views but also to child widgets and control the visibility and display style of child elements. Dialogs also get control over the sending functions of the widgets. The query that will be displayed in the View. The actions pass through a module that prepares the received data and passes it as keyword parameters to the decorated function. It is all found in the ``kwargs`` and you just make them available. The ``item`` parameter is an example of this and represents the dataset returned by the frontend. To find out what else is in the ``kwargs`` please use the debugger. The Base is the support element for the View and the template for the data source in the frontend. The base classes serve the decore application as a carrier element for the view components, maintain the data model and are thus also considered the data source for evaluation in the dashboard frontend. The description of the action. The description of the View. The description of the Base. The description of the dialogue. The description of the widget. The fields that will be displayed in the widget. The fields that will be displayed in the View. The filters that are displayed in the View. The ID of the parent element. To be set only if the widget is to be rendered in a dialog of another Base. The ID of the parent element. To be set only if the dialog is to be rendered in a View of another Base. The ID of the parent element. To be set only if the action is to be rendered in a widget of another Base. The ID of the parent element. Only to be set if the View is to be rendered in a different Base. The ID, in the form of a UUID in text format, is generated automatically and does not need to be specified separately. The models in **decore Base** are based on the great Peewee ORM. To learn more about Peewee, visit `Peewee ORM <http://docs.peewee-orm.com/en/latest/>`_. The decorated functions serve, first and foremost, to create meta-information for later evaluation in the front-end of the application and are nothing to be afraid of. The recommended IDE is Visual Studio Code and all my comments and documentation here also refer to vscode only. The biggest help I can get right now is if you take a look at the project and tell me what you think. I am grateful for any criticism. This requires an enabled Python environment! To learn more, visit `Python Environments in VS Code <https://code.visualstudio.com/docs/python/environments>`_. This documentation was translated from German into English with Deepl. This class provides all the necessary functions to define a decore application. It also holds the routes for communication with the frontend. Docs Documentation A widget is used to display and interact with the dataset. It receives the data that the dialog activator specifies. The value ``none`` passes the last record of the database table. The value ``default`` passes a dataset filled only with default values. The value ``context`` passes the record selected in the context menu of the View. And ``click`` passes the record that was clicked. An action is the actual interaction between the user and the backend. A View is a container for displaying data. A function is executed directly after the metadata pool is compiled. Functions can be used to extend the logic, prepare things or do background tasks. they act as instance methods of the Base and thus maintain the object-oriented approach. A function to open a GUI dashboard application. It is used as a "decorator". A function to register a Base in the GUI dashboard application. It is used as a "decorator". A function for registering an action. It is used as a "decorator". A function for registering a View. It is used as a "decorator". A function to register a function in the parent base. It is used as a "decorator". A function for registering a dialog. It is used as a "decorator". A function for registering a widget. It is used as a "decorator". Development Get started First, create an empty Python project in your desired directory. Build GUI dashboard applications in Python fast and easy. Now let's create a new file named **app.py** in the root directory of the project. Build But there are also widgets that can display multiple data sets, as in the example before, the relations are used here to display only data that has something to do with the selected item. It is not necessary to create a model for each base, but each model to be used must have a base, which must be imported via the file **__init__.py**. This is the only way to evaluate and display rellations between the models in the frontend. Fields Finished SPA (Single Page Application) with Vue.js using the Quasar Framework (https://github.com/quasarframework/quasar) Functions and integrations Get started Specify how the action is triggered. Indicates what the action can do. Specifies how the widget will display the data. Specifies how the dialog will display the widgets. The value ``standard`` represents the child widgets and sub-widgets one below the other. Specifies how the records are displayed. The value ``table`` represents the records in a table. Specifies how a function is run. With the value ``shot`` it will be executed only once. The value ``work`` is executed in a thread and can therefore run loops that never end until the main thread ends. Specifies how many records to display on one page of the View. ``16`` is the default setting. Here we go ... again the file **first_base.py** and extend the code as follows: If True, the field is allowed to be null. Defaults to False. In the example shown here, we import the Conform_model class from the **uniform library** and extend it with the First Name and Last Name fields. In a Model, we define the data fields that must later be assigned to a Base. It serves as a database interface to the database drivers like SQLite, MySQL, PostgreSQL, etc. In order for the Python interpreter to be able to process the base classes, we have to import them into the __init__.py file in the **bases** directory. The order of the individual imports also determines the order in **decore Front**. In our case, we create a dialog to create a new person with first name and last name. Installation Integrated ORM for data management and database interfaces (SQLite) powered by the great Peewee (https://github.com/coleifer/peewee) Introduction Using the View decorator, we can now create a View component and mount it, under the base class we created earlier. Model Normally, a Python main module contains a query that checks if it is the main module so that we can subsequently call the ``main`` function. Notes Now we need to create a new Python module containing, for example, a base class: **first_base.py**, in the **bases** directory in our project root directory. The **bases** directory was co-created by the ``python app.py --prepare`` command executed earlier. Parameters Password management with pykeepass (https://github.com/libkeepass/pykeepass) Sample Sample application The BackRefMetaField is used by the user to represent relationships in the **decore Front** application. For example, it can be assigned to the filter or to a form. It is a MetaField and does not get a column in the database. The BackRefMetaField's name must match the name of the specified backref in the ForeignKey or ManyToMany field in the reference model. The default value for the field. Defaults to None. The keybase is a KeePass file and should be protected by setting the correct access rights (ACL). The model to which the relationship is to be established. The name of the field in the reference model that represents the relationship to the model. To better understand how decore base works, it is best to look at the sample application. The application represents my continuous development of decore base. To develop your application, use your debugger with the ``[dev] decore base development`` profile in vscode. To build your application, run ``python app.py --build`` in your project root directory. Use the terminal in vscode. To start your application, run ``python app.py`` in your project root directory. Use the terminal in vscode. To use the previously created model, we import it into the Base class and pass it to the ``model`` parameter. To install decore Base, we run the following command in the root directory of the project. Let's use the terminal in vscode. To use decore, we first import it into the **app.py** module. To illustrate the fast GUI dashboard creation, using decore Base in Python, we will now create a small UI together in the form of a web application. To create a new "decore" application instance, we use a ``main()`` function decorated with ``@decore.app`` in the **app.py** file, just below the line: ``if __name__ == '__main__':``. To build a dataset with decore Base, we need to create an instance of the Model. In our case **First_model**. The instance is filled with the data from the form and then saved. In order to get everything we need in terms of paths and settings for our future Python GUI dashboard application, we still need to do the preparation. To avoid possible circular imports, we create the model classes in a separate **models** directory in our project root directory. The **models** directory was created by the previously executed ``python app.py --prepare`` command. Now to actually prepare the application, we run the command ``python app.py --prepare`` in the terminal. The path must be in the root directory of the project, i.e. where the **app.py** is located. Usage View Views are used by the decore application to present the data sets in the front end of the web application. Preparation Predefined webapi for metadata and actions with Flask (https://github.com/pallets/flask) What we need now is an input form to enter the data for the new person. We edit the **__init__.py** file and insert the following code: If you find something in the documentation related to features, bugs or ambiguities, please let me know. Please use the problem area in the repository to do so. `<https://github.com/KemoPanzah/decore_Base/issues>`_ Widget Widgets are components that allow us to perform interactions with the single record. They can only be added to dialogs and are stackable. Widgets, which are assigned to a dialog from a foreign Base, supplement the relational fields of a default item of the foreign data source with the data of the activated item. (That sentence is crap to understand, but it hits exactly what it does). In the Sample application, I use this when assigning "Contracts" to a "Person". We now edit the **first_base.py** file again and extend the code as follows: We now need an action to store the data of the new person and extend the code in **first_base.py** as follows: We now create the file first_model.py in the directory **models** and insert the following code: Selects the method how the records of the view are loaded. The value ``client`` loads all records at once and leaves the page building to the frontend. create dashbord with python fastly decore Base is an out-of-the-box "Python to Vue.js" data application dashboard that helps you go from idea to view in a few simple steps. It is aimed at those who want to focus on the results of their algorithms, do scientific work, or perform teaching and learning functions. decore Base | UI fastly https://github.com/KemoPanzah/decore_Sample index, follow python gui, decore, python database, python dashboard, python orm, python ui, dashboard creation, python application, ui framework, ui toolkit Open the browser and type ``http://localhost:5555``. 