import 'dart:html';
import 'dart:svg' as svg;

void main() {
  var numUpdates = 0;
  var numRows = 0;
  var table = querySelector("#vanilla_dart_mount_point");
  var addButton = querySelector("#dart_add");
  var updateButton = querySelector("#dart_update");

  addButton.onClick.listen((_) {
    for (var i = 0; i < 1000; i++) {
      var rowI = numRows + i;
      var newRow = document.createElement('tr');

      var newTd1 = document.createElement('td')
        ..text = 'row $rowI  col 1 update $numUpdates | ';

      var newTd2 = document.createElement('td')
        ..text = 'row $rowI  col 2 update $numUpdates | ';

      var newTd3 = document.createElement('td')
        ..text = 'row $rowI  col 3 update $numUpdates | ';

      newRow.append(newTd1);
      newRow.append(newTd2);
      newRow.append(newTd3);
      table.append(newRow);
    }
    numRows += 1000;
  });

  updateButton.onClick.listen((_) {
    numUpdates++;
    for (var i = 0; i < table.children.length; i++) {
      var row = table.children[i];
      for (var j = 0; j < row.children.length; j++) {
        row.children[j].childNodes[0].text =
            'row $i col $j update $numUpdates | ';
      }
    }
  });

  var numSvgUpdates = 0;
  var numSvgRows = 0;
  svg.SvgElement svgRoot =
      document.querySelector("#vanilla_dart_svg_mount_point");
  var addSvgButton = document.querySelector("#dart_svg_add");
  var updateSvgButton = document.querySelector("#dart_svg_update");

  addSvgButton.onClick.listen((_) {
    for (var i = 0; i < 1000; i++) {
      var rowI = numSvgRows + i;
      var newRow = new svg.TextElement()
        ..text = 'svg row $rowI update $numSvgUpdates'
        ..attributes['y'] = '${rowI * 10}';

      svgRoot.append(newRow);
    }
    numSvgRows += 1000;
    svgRoot.style.height = '${numSvgRows * 10}';
  });

  updateSvgButton.onClick.listen((_) {
    numSvgUpdates++;
    var i = 0;
    for (var c in svgRoot.children) {
      c.text = 'svg row $i update $numSvgUpdates';
      i++;
    }
  });
}
