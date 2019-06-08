import 'package:scoped_model/scoped_model.dart';

class SettingModel extends Model {
	String username;
	int _count = 0;
	int get count => _count;

	void increaseCount(){
		_count++;
		notifyListeners();
	}
}
