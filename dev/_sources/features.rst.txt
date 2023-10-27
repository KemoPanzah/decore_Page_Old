Features
========

Decore ist eine Biblitothek zur Erstellung von Gui-Dashboard-Anwendungen in Python die ein vielzahl an Eigenschaften hervorbringt und auch in zukunft stetig erweitert wird.

Durch die Verbindung einiger wirklich guter Python-Pakete war die Arbeit an decore überhaupt erst möglich. Daher möchte ich mich an dieser Stelle bei den Entwicklern der folgenden Pakete bedanken:

* **Peewee** - Ein einfaches, aber leistungsstarkes ORM, das eine flexible Datenbankanbindung für Python bietet. http://docs.peewee-orm.com/en/latest/index.html
* **Flask** - Ein Microframework für Python basierend auf Werkzeug, Jinja 2 und guter Absichten. http://flask.pocoo.org/
* **Quasar** - Ein Vue.js basiertes Frontend-Framework. https://quasar-framework.org/
* **Vue.js** - Ein progressiver, inkrementeller JavaScript-Framework für die Entwicklung von Benutzeroberflächen. https://vuejs.org/
* **Cerberus** - Eine Validierungs-Bibliothek für Python-Datenstrukturen. http://docs.python-cerberus.org/en/stable/
* **pykeepass** - Eine Bibliothek zum interagieren von KeePass 1.x und 2.x Datenbanken. http://pykeepass.readthedocs.io/en/latest/

.. Modulbeschreibung
.. -----------------
.. - **Actor** - Ein Modul zur Aktionssteuerung zwischen Backend und Frontend.
.. - **Mayor** - Ein Modul zur Authentifizierung und Speicherung von Benutzern.
.. - **Oracle** - Zur Verarbeitung und speicher von Benutzer-Datenbankabfragen die aus dem Frontend kommen.

Die nun folgenden Feature- und Änderungs-Aufzählungen sind in decore Base enthalten.

Management & Backend-Anwendung
------------------------------
- schnelle und einfache GUI-Dashboard-Anwendungs Entwicklung mittels Python Decorators.
- Erhaltung des Objekt-Orientierten Programmierstils in den Basisklassen, durch Aktionsufruf als Instanzmethoden.
- Speichung von wiederverwendbaren Kennwörtern (**keine Benutzerkennwörter**) in einer KeePass-Datenbank (**Hier wird noch ein Sicherheitsleitfaden erstellt**).
- Fortschrittsmitteilung an das Frontend durch das Actor-Modul.

ORM Erweiterung & Datenbankanbindung
------------------------------------
- Einfache Datensatzereugung mit angepasster aber vereinfachter Peewee-Integration.
- Derzeit Mögliche Datenbank-Schnittstellen: SQLite ... (**Hier kommt schon bald mehr** ).
- Relationale Datenbank-Abfragen mit einer eigenen ``query`` Methode in im decore Model.
- Semi-Automatische Datensatzerstellung bei Aktionsverwendung durch das Actor-Modul.
- Intergrierte Feldattribut definierte Standard-Validierung beim speichern eines Datensatzes.

Webanwendung (SPA)
------------------
- Automatische und generische Erzeugung der GUI-Dashboard-Komponenten anhand der erfassten Metadaten.
- Vorgefertigtes Layout, reagierende Navigationsleiste und Basisbreich für die Ansicht-Komponenten.
- Dialogsteuerung durch URL-Navigation
- Erzeugung eines relationalen Datensatzes für die weiterverwenung im Widget.