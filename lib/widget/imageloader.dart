
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class GlideWidget extends StatefulWidget {

  final String imageUrl;
  final bool clipOval ;
  final double? width ;
  final double? height ;
  final String? placeIcon;
  final String? errorIcon;
  final double radius;

  GlideWidget({
      Key? key,
      this.clipOval = false,
      this.width,
      this.height,
      this.placeIcon,
      this.errorIcon,
      this.radius = 0,
      required this.imageUrl}) :
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
    if(widget.radius == 0) return _child();
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
          placeholder: (widget.placeIcon != null) ? (context , url) => _placeWidget(widget.placeIcon!,) : null,
          errorWidget :(widget.errorIcon != null) ? (context, url, error) => _errorWidget(widget.errorIcon!) : null,
          imageUrl: widget.imageUrl,
        )
    );
  }

  Widget _placeWidget(String placeHolder){
    return Image.asset(placeHolder);
  }

  Widget _errorWidget(String errorHolder){
    return Image.asset(errorHolder);
  }

}