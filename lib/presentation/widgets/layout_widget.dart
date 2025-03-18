import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_layout_task/data/models/cell_data_model.dart';
import 'package:flutter_layout_task/data/models/layout_config_model.dart';
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
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: _buildContentWidget(config.data!),
      );
    }

    final List<Widget> children = [];
    if (config.children != null) {
      for (var child in config.children!) {
        children.add(Expanded(
          flex: child.flex,
          child: _buildLayoutWidget(child),
        ));
      }
    }

    if (config.type == 'Row') {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else if (config.type == 'Col') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    }

    return Container(
      alignment: Alignment.center,
      color: Colors.grey[200],
      child: Text('Unknown layout type: ${config.type}'),
    );
  }

  Widget _buildContentWidget(CellDataModel data) {
    switch (data.type) {
      case 'Image':
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Image.network(
            data.value,
            fit: BoxFit.contain,
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
