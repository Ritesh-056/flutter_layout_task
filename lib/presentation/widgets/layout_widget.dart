import 'package:flutter/material.dart';
import 'package:flutter_layout_task/data/models/cell_data_model.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/layout_config_model.dart';
import 'video_player_widget.dart';

class LayoutWidget extends StatelessWidget {
  final LayoutConfigModel config;

  const LayoutWidget({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return _buildLayoutWidget(config);
  }

  Widget _buildLayoutWidget(LayoutConfigModel config) {
    if (config.data != null) {
      return Flexible(
        flex: config.flex,
        child: _buildContentWidget(config.data!),
      );
    }

    final List<Widget> children = [];
    if (config.children != null) {
      for (var child in config.children!) {
        children.add(_buildLayoutWidget(child));
      }
    }
    if (config.type == 'Row') {
      return Flexible(
        flex: config.flex,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      );
    } else if (config.type == 'Col') {
      return Flexible(
        flex: config.flex,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      );
    }
    return Flexible(
      flex: config.flex,
      child: Container(
        alignment: Alignment.center,
        color: Colors.grey[200],
        child: Text('Unknown layout type: ${config.type}'),
      ),
    );
  }

  Widget _buildContentWidget(CellDataModel data) {
    switch (data.type) {
      case 'Image':
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(
              data.value,
              fit: BoxFit.contain,
            ),
          ),
        );
      case 'Video':
        return VideoPlayerWidget(url: data.value);
      case 'Url':
        return InkWell(
          onTap: () => launchUrl(Uri.parse(data.value)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(data.value),
          ),
        );
      default:
        return Container(
          alignment: Alignment.center,
          color: Colors.grey[200],
          child: Text('Unknown content type: ${data.type}'),
        );
    }
  }
}
