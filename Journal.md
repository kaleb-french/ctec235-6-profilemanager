# Journal
Write your Journal questions and notes here.

Phase 1-
A statless widget doen't maintain a mutable or changeable state. However the Statful widget is created with an acompanying state object that holds the state and on a setState() the widget is rebuilt to reflect the new state. In this example the stateful widget is able to rebuild itself when a state changes, however a stateless widget owns no state to rebuild it self with, a parent would have to rebuild the widget instead.

Phase 2-
The GlobalKey<FormState> is created in the form ala the _formKey.currentState!.validate() to on submit pressed check the form it was created for and run the validators on all form fields to validate the whole form at once.

Phase 3-
The username variable needs to be inplace where both sides can access. The form is where the username is being set, but the UserBanner is where the username is being displayed. Because of this it has to been in profilescreen so it can be passed from the form to the banner. The favorite button in this case is more self-contained having the proties to display the button and change it in the same stateful widget.
