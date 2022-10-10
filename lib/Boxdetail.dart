class Box_detail{
    String? id;
    String? Text;
    bool status;
    Box_detail({
        required this.id
        , required this.Text,
        this.status = false
    });

     static List<Box_detail> Box_List(){
         return[
             Box_detail(id: '01',Text: 'ทำการบ้านครั้งที่ 4 วิชา Mobile App Dev', status: true),
             Box_detail(id: '02',Text: 'ทำการบ้านครั้งที่ 5 วิชา Mobile App Dev',),
             Box_detail(id: '03',Text: 'ทำโปรเจ็ควิชา Mobile App Dev',),
         ];
    }

}
