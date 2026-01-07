// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.



void main() {


    print(_test1());

}

_test(){
    List list = [1,3,4,5,];
    for(var a in list) {
            if(a > 4){
                print('$a');
                return;
            }
        }
    

    print("hello");
}

_test1(){
    List list = [1,3,4,5,];
    for (var a in list) {
            if(a > 4){
                print('$a');
                return "1111";
            }
        }

    print("hello");
    return "2222";
}
