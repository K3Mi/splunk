<form theme="dark">
  <label>Splunk - IDX - 05 - Disk IO Statistics - Dashboard - v1</label>
  <search id="baseSearch">
    <query>
            index=osnixperf sourcetype=iostat splunk_server_group=dmc_group_indexer | fields _time host avgQueueSZ avgSvcMillis avgWaitMillis bandwUtilPct latency rKB_PS rReq_PS read_ops total_ops wKB_PS wReq_PS write_ops
        </query>
    <earliest>$TimeRangePkr.earliest$</earliest>
    <latest>$TimeRangePkr.latest$</latest>
  </search>
  <fieldset submitButton="true" autoRun="true">
    <input type="time" token="TimeRangePkr">
      <label>Time Range</label>
      <default>
        <earliest>-15m</earliest>
        <latest>now</latest>
      </default>
    </input>
  </fieldset>
  <row>
    <panel>
      <html>
            <h3>Disk Statistics</h3>
            <p/> Report input/output statistics for disks.
            <p/> The iostat command is used for monitoring system input/output device loading by observing the time the devices are active in relation to their average transfer rates. The iostat command generates reports that can be used to change system configuration to better balance the input/output load between physical disks. 
            <p/> Deploy The Splunk Add-on for Unix and Linux (Splunk_TA_nix) to the Indexer Tier:
            <a href="https://splunkbase.splunk.com/app/833">https://splunkbase.splunk.com/app/833</a> 
            <p/> Configure inputs.conf: Splunk_TA_nix/local 
            <p/> [script://./bin/iostat.sh] 
            <p/> disabled = false
            <p/> index = osnixperf
            <p/> interval = 60
            <p/> More Information on iostat:
            <a href="https://linux.die.net/man/1/iostat">https://linux.die.net/man/1/iostat</a>.
            </html>
    </panel>
  </row>
  <row>
    <panel>
      <title>Device Average Time in milliseconds AKA Latency</title>
      <chart>
        <title>The average time (in milliseconds) for I/O requests issued to the device to be served. This includes the time spent by the requests in queue and the time spent servicing them.</title>
        <search base="baseSearch">
          <query>timechart max(avgWaitMillis) by host</query>
        </search>
        <option name="charting.chart">line</option>
        <option name="charting.drilldown">none</option>
      </chart>
    </panel>
    <panel>
      <title>Device Average Queue Length</title>
      <chart>
        <title>The average queue length of the requests that were issued to the device.</title>
        <search base="baseSearch">
          <query>timechart max(avgQueueSZ) by host</query>
        </search>
        <option name="charting.chart">line</option>
        <option name="charting.drilldown">none</option>
        <option name="refresh.display">progressbar</option>
      </chart>
    </panel>
  </row>
  <row>
    <panel>
      <title>Device Bandwidth Utilization</title>
      <chart>
        <title>Percentage of CPU time during which I/O requests were issued to the device. Device saturation occurs when this value is close to 100%.</title>
        <search base="baseSearch">
          <query>timechart max(bandwUtilPct) by host</query>
        </search>
        <option name="charting.chart">line</option>
        <option name="charting.drilldown">none</option>
      </chart>
    </panel>
    <panel>
      <title>Device Average Service Time in milliseconds</title>
      <chart>
        <title>The average service time (in milliseconds) for I/O requests that were issued to the device.</title>
        <search base="baseSearch">
          <query>timechart max(avgSvcMillis) by host</query>
        </search>
        <option name="charting.chart">line</option>
        <option name="charting.drilldown">none</option>
      </chart>
    </panel>
  </row>
  <row>
    <panel>
      <title>Device Read &amp; Write KB Per Second</title>
      <chart>
        <title>The amount of data Read &amp; Written from the device expressed in kilobytes per second.</title>
        <search base="baseSearch">
          <query>timechart max(rKB_PS) as rKB_PS max(wKB_PS) as wKB_PS by host</query>
        </search>
        <option name="charting.axisTitleX.visibility">collapsed</option>
        <option name="charting.axisTitleY.visibility">collapsed</option>
        <option name="charting.axisTitleY2.visibility">collapsed</option>
        <option name="charting.chart">area</option>
        <option name="charting.chart.showDataLabels">minmax</option>
        <option name="charting.chart.stackMode">stacked</option>
        <option name="charting.drilldown">none</option>
        <option name="charting.layout.splitSeries">1</option>
        <option name="charting.legend.placement">none</option>
        <option name="refresh.display">progressbar</option>
        <option name="trellis.enabled">1</option>
      </chart>
    </panel>
  </row>
  <row>
    <panel>
      <title>Read &amp; Write Operations Per Second</title>
      <chart>
        <title>The number of Read &amp; Write operations that were issued to the device per second.</title>
        <search base="baseSearch">
          <query>timechart max(read_ops) as read_ops max(write_ops) as write_ops by host</query>
        </search>
        <option name="charting.axisTitleX.visibility">collapsed</option>
        <option name="charting.axisTitleY.visibility">collapsed</option>
        <option name="charting.axisTitleY2.visibility">collapsed</option>
        <option name="charting.chart">area</option>
        <option name="charting.chart.nullValueMode">zero</option>
        <option name="charting.chart.showDataLabels">minmax</option>
        <option name="charting.chart.stackMode">stacked</option>
        <option name="charting.drilldown">none</option>
        <option name="charting.layout.splitSeries">1</option>
        <option name="charting.legend.placement">none</option>
        <option name="refresh.display">progressbar</option>
        <option name="trellis.enabled">1</option>
        <option name="trellis.scales.shared">1</option>
        <option name="trellis.size">medium</option>
        <option name="trellis.splitBy">host</option>
      </chart>
    </panel>
  </row>
</form>
