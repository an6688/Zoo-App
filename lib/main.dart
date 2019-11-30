import 'controller/controller.dart';
import 'model/animal.dart';
import 'model/model.dart';
import 'view/app.dart';

// MyApp factored out into vie/app.dart, done by Jordan Clark
void main()
{
  var view = ZooApp(null);
  Model model = Model.mockModel([
    Animal(0, "Giraffe", "Giraffa camelopardalis"),
    Animal(1, "Dog", "Canis lupus familiaris"),
  ]);
  var controller = Controller(view, model);
  controller.start();
}

