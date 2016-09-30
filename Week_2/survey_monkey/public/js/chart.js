
///////////////////////////////////////////////////////////////////////////
////////////////                GRAPHICS              /////////////////////
///////////////////////////////////////////////////////////////////////////

$(document).ready(function() {
  var q1 = $('.hidden li:nth-child(1)').text()
            + " (" + $('.hidden li:nth-child(3)').text()
            + ", " + $('.hidden li:nth-child(5)').text()
            + ", " + $('.hidden li:nth-child(7)').text()
            +")";
  var op11 = $('.hidden li:nth-child(2)').text();
  var op12 = $('.hidden li:nth-child(4)').text();
  var op13 = $('.hidden li:nth-child(6)').text();

  var q2 = $('.hidden li:nth-child(8)').text()
            + " (" + $('.hidden li:nth-child(10)').text()
            + ", " + $('.hidden li:nth-child(12)').text()
            + ", " + $('.hidden li:nth-child(14)').text()
            +")";
  var op21 = $('.hidden li:nth-child(9)').text();
  var op22 = $('.hidden li:nth-child(11)').text();
  var op23 = $('.hidden li:nth-child(13)').text();

  var q3 = $('.hidden li:nth-child(15)').text()
            + " (" + $('.hidden li:nth-child(17)').text()
            + ", " + $('.hidden li:nth-child(19)').text()
            + ", " + $('.hidden li:nth-child(21)').text()
            +")";
  var op31 = $('.hidden li:nth-child(16)').text();
  var op32 = $('.hidden li:nth-child(18)').text();
  var op33 = $('.hidden li:nth-child(20)').text();

  var data = {
    labels: [
      q1, q2, q3
    ],
    series: [
      {
        label: 'Option1',
        values: [op11, op21, op31]
      },
      {
        label: 'Option2',
        values: [op12, op22, op32]
      },
      {
        label: 'Option3',
        values: [op13, op23, op33]
      },]
  };

  var chartWidth       = 300,
      barHeight        = 40,
      groupHeight      = barHeight * data.series.length,
      gapBetweenGroups = 10,
      spaceForLabels   = 400,
      spaceForLegend   = 150;

  // Zip the series data together (first values, second values, etc.)
  var zippedData = [];
  for (var i=0; i<data.labels.length; i++) {
    for (var j=0; j<data.series.length; j++) {
      zippedData.push(data.series[j].values[i]);
    }
  }

  // Color scale
  var color = d3.scale.category20();
  var chartHeight = barHeight * zippedData.length + gapBetweenGroups * data.labels.length;

  var x = d3.scale.linear()
      .domain([0, d3.max(zippedData)])
      .range([0, chartWidth]);

  var y = d3.scale.linear()
      .range([chartHeight + gapBetweenGroups, 0]);

  var yAxis = d3.svg.axis()
      .scale(y)
      .tickFormat('')
      .tickSize(0)
      .orient("left");

  // Specify the chart area and dimensions
  var chart = d3.select(".chart")
      .attr("width", spaceForLabels + chartWidth + spaceForLegend)
      .attr("height", chartHeight);

  // Create bars
  var bar = chart.selectAll("g")
      .data(zippedData)
      .enter().append("g")
      .attr("transform", function(d, i) {
        return "translate(" + spaceForLabels + "," + (i * barHeight + gapBetweenGroups * (0.5 + Math.floor(i/data.series.length))) + ")";
      });

  // Create rectangles of the correct width
  bar.append("rect")
      .attr("fill", function(d,i) { return color(i % data.series.length); })
      .attr("class", "bar")
      .attr("width", x)
      .attr("height", barHeight - 1);

  // Add text label in bar
  bar.append("text")
      .attr("x", function(d) { return x(d) - 3; })
      .attr("y", barHeight / 2)
      .attr("fill", "red")
      .attr("dy", ".35em")
      .text(function(d) { return d; });

  // Draw labels
  bar.append("text")
      .attr("class", "label")
      .attr("x", function(d) { return - 10; })
      .attr("y", groupHeight / 2)
      .attr("dy", ".35em")
      .text(function(d,i) {
        if (i % data.series.length === 0)
          return data.labels[Math.floor(i/data.series.length)];
        else
          return ""});

  chart.append("g")
        .attr("class", "y axis")
        .attr("transform", "translate(" + spaceForLabels + ", " + -gapBetweenGroups/2 + ")")
        .call(yAxis);

  // Draw legend
  var legendRectSize = 18,
      legendSpacing  = 4;

  var legend = chart.selectAll('.legend')
      .data(data.series)
      .enter()
      .append('g')
      .attr('transform', function (d, i) {
          var height = legendRectSize + legendSpacing;
          var offset = -gapBetweenGroups/2;
          var horz = spaceForLabels + chartWidth + 40 - legendRectSize;
          var vert = i * height - offset;
          return 'translate(' + horz + ',' + vert + ')';
      });

  legend.append('rect')
      .attr('width', legendRectSize)
      .attr('height', legendRectSize)
      .style('fill', function (d, i) { return color(i); })
      .style('stroke', function (d, i) { return color(i); });

  legend.append('text')
      .attr('class', 'legend')
      .attr('x', legendRectSize + legendSpacing)
      .attr('y', legendRectSize - legendSpacing)
      .text(function (d) { return d.label; });

});
