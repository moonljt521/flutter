
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class GlideWidget extends StatefulWidget {

  final String imageUrl;
  final bool clipOval ;
  final double width ;
  final double height ;
  final String placeIcon;
  final String errorIcon;
  final double radius;

  GlideWidget({
      Key key,
      this.clipOval = false,
      this.width,
      this.height,
      this.placeIcon,
      this.errorIcon,
      this.radius = 0,
      @required this.imageUrl}) :
        super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _GlideState();
  }
}

class _GlideState extends State<GlideWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.clipOval ? ClipOval(child: _child()) : _clipRRect();
  }

  Widget _clipRRect() {
    if(widget.radius == null || widget.radius == 0) return _child();
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: _child(),
    );
}

  Widget _child(){
    return Container(
        width: widget.width,
        height: widget.height,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          placeholder: (context , url) => _placeWidget(widget.placeIcon,),
          errorWidget :(context, url, error) => _errorWidget(widget.errorIcon),
          imageUrl: widget.imageUrl,
        )
    );
  }

  Widget _placeWidget(String placeHolder){
    if(placeHolder != null) return Image.asset(placeHolder);
    return Container();
  }

  Widget _errorWidget(String errorHolder){
    if(errorHolder != null) return Image.asset(errorHolder);
    return Container();
  }

}