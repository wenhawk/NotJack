<div class="row">
  <div class="col-md-6">
    <div id="piechart1"></div>
  </div>
  <div class="col-md-6">
    <div id="piechart2"></div>
  </div>
</div>

<div class="row">
  <div class="col-md-2">

  </div>
  <div class="col-md-8">
    <div id="chart_div"></div>
  </div>
  <div class="col-md-2">

  </div>
</div>


<script type="text/javascript" src="js/loader.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data1 = google.visualization.arrayToDataTable([
  ['Month', 'Amount'],
  ['JAN', <?= $month->jan?>],
  ['FEB', <?= $month->feb?>],
  ['MAR', <?= $month->mar?>],
  ['APR', <?= $month->apr?>],
  ['MAY', <?= $month->may?>],
  ['JUN', <?= $month->jun?>],
  ['JUL', <?= $month->jul?>],
  ['AUG', <?= $month->aug?>],
  ['SEP', <?= $month->sep?>],
  ['OCT', <?= $month->oct?>],
  ['NOV', <?= $month->nov?>],
  ['DEC', <?= $month->dec?>]
]);
  var data2 = google.visualization.arrayToDataTable([
  ['Month', 'Amount'],
  ['JAN', <?= $month->janPaid?>],
  ['FEB', <?= $month->febPaid?>],
  ['MAR', <?= $month->marPaid?>],
  ['APR', <?= $month->aprPaid?>],
  ['MAY', <?= $month->mayPaid?>],
  ['JUN', <?= $month->junPaid?>],
  ['JUL', <?= $month->julPaid?>],
  ['AUG', <?= $month->augPaid?>],
  ['SEP', <?= $month->sepPaid?>],
  ['OCT', <?= $month->octPaid?>],
  ['NOV', <?= $month->novPaid?>],
  ['DEC', <?= $month->decPaid?>]
]);

  // Optional; add a title and set the width and height of the chart
  var options1 = {'title':'REPORT Invoice <?= $year?> ', 'width':700, 'height':700};
  var options2 = {'title':'REPORT Total Paid <?= $year?> ', 'width':700, 'height':700};

  // Display the chart inside the <div> element with id="piechart"
  var chart1 = new google.visualization.PieChart(document.getElementById('piechart1'));
  var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
  chart1.draw(data1, options1);
  chart2.draw(data2, options2);

google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = google.visualization.arrayToDataTable([
        ['Year', 'Amount',],
        <? foreach($years as $y) {?>
        ['<?= $y->year ?>', <?= $y->amount ?>],
        <? } ?>
      ]);

      var options = {
        title: 'Population of Largest U.S. Cities',
        chartArea: {width: '100%'},
        hAxis: {
          title: 'Total Population',
          minValue: 0
        },
        vAxis: {
          title: 'City'
        }
      };

      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
}
</script>
