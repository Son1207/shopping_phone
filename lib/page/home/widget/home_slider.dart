import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/providers/slider_provider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late Future sliderFuture;
  @override
  void didChangeDependencies() {
    // TODO: implement initState
    sliderFuture = Provider.of<SliderProvider>(context).getSlider();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20  ),
      child: FutureBuilder(
        future: sliderFuture,
        initialData: [],
        builder: (context,asyncData){
          var sliderData=[];
          if(asyncData.hasData){
            sliderData = asyncData.data! as List;
          }
          else {
            return Container(
              child: Text('No data'),
            );
          }

          return asyncData.hasData ? CarouselSlider(
            options: CarouselOptions(autoPlay: true),
            items: sliderData.map((i) { 
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage(i.image))
                      ),
                  );
                },
              );
            }).toList(),
          ): Container(child: const Text('No Data'),);
        },
      ),
    );
  }
}
