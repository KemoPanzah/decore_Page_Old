
Fields
******

**class BackrefMetaField(help_text=None, verbose_name=None, filter_fields=[], choice_query={})**

   Warning: The BackRefMetaField’s name must match the name of the specified backref in the ForeignKey or ManyToMany field in the reference model.

   The BackRefMetaField is used by the user to represent relationships in the **decore Front** application. For example, it can be assigned to the filter or to a form. It is a MetaField and does not get a column in the database.

   :Parameters:      
      * **verbose_name** (*str*) – A human-readable name for the field.

      * **help_text** (*str*) – Additional text to be displayed in **decore Front**.

      * **filter_fields** (*list*) – A List of type string. Only the speciefied fields will be displayed in the filter. If None, all fields will be displayed.

      * **choice_query** (*dict*) – A dictonary containing a query to be used when querying options (e.g. in selection fields in the frontend). The query always refers to the reference model.

   .. code-block:: python

      class User(Conform_model):
          username = CharField(verbose_name='Username')
          accounts = BackRefMetaField(null=True, verbose_name='Accounts', choice_query={'domain__eq': 'example.com'}

   .. code-block:: python

      class Account(Conform_model):
          user = ForeignKeyField(User, backref='accounts', null=True, verbose_name='User')
          prefix = CharField(verbose_name='Mail prefix')
          domain = CharField(verbose_name='Mail domain', default='example.com')

**class BooleanField(null=False, default=None, help_text=None, verbose_name=None)**

   A field to store boolean values.

   :Parameters:      
      * **null** (*bool*) – If True, the field is allowed to be null. Defaults to False.

      * **default** (*bool*) – The default value for the field. Defaults to None.

      * **help_text** (*str*) – Additional text to be displayed in **decore Front**.

      * **verbose_name** (*str*) – A human-readable name for the field.

**class CharField(null=False, default=None, choices=None, help_text=None, verbose_name=None)**

   A field to store char values.

   :Parameters:      
      * **null** (*bool*) – If True, the field is allowed to be null. Defaults to False.

      * **default** (*bool*) – The default value for the field. Defaults to None.

      * **help_text** (*str*) – Additional text to be displayed in **decore Front**.

      * **verbose_name** (*str*) – A human-readable name for the field.

**class ManyToManyField(model, backref=None, help_text=None, verbose_name=None, filter_fields=[], choice_query={})**

   A field to represent a many-to-many relationship between two models. It is a MetaField and does not get a column in the database. However, a through model is created by decore Base, which represents the relationship between the two models.

   :Parameters:      
      * **model** (*Model*) – The model to which the relationship is to be established.

      * **backref** (*str*) – The name of the field in the reference model that represents the relationship to the model.

      * **null** (*bool*) – If True, the field is allowed to be null. Defaults to False.

      * **verbose_name** (*str*) – A human-readable name for the field.

      * **help_text** (*str*) – Additional text to be displayed in **decore Front**.

      * **filter_fields** (*list*) – A List of type string. Only the speciefied fields will be displayed in the filter. If None, all fields will be displayed.

      * **choice_query** (*dict*) – A dictonary containing a query to be used when querying choices (e.g. in selection fields in the frontend). The query always refers to the reference model.

   .. code-block:: python

      class Account(Conform_model):
          users = ManyToManyField(User, backref='accounts', null=True, verbose_name='Users')
          prefix = CharField(verbose_name='Mail prefix')
          domain = CharField(verbose_name='Mail domain', default='example.com')

   .. code-block:: python

      class User(Conform_model):
          username = CharField(verbose_name='Username')
          accounts = BackRefMetaField(null=True, verbose_name='Accounts', choice_query={'domain__eq': 'example.com'}

**class PasswordField(null=False, help_text=None, verbose_name=None)**

   Warning: The keybase is a KeePass file and should be protected by setting the correct access rights (ACL).

   A field to store passwords in the keybase and to use them again.

   :Parameters:      
      * **null** (*bool*) – If True, the field is allowed to be null. Defaults to False.

      * **help_text** (*str*) – Additional text to be displayed in **decore Front**.

      * **verbose_name** (*str*) – A human-readable name for the field.

   .. code-block:: python

      class User(Conform_model):
          password = PasswordField(null=False, verbose_name='Password')
