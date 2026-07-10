<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <style>
       .protestPanel      { display: none; }
       .protestPanel.show { display: block; }

       .outdented   { padding-left: 1.5em;  text-indent: -1.5em; }
       .indented    { padding-left: 1.5em;}
   </style>

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>

   <script>
      function setCounty(code) {
         countySelector = document.getElementById("countySelector");
         if (countySelector != null)  countySelector.selectedIndex = code;
      }

      function newCounty() {
         countySelector = document.getElementById("countySelector");
         location.href  = "protests.php?county=" + countySelector.selectedIndex;
      }

      function flipVisibility (id) {
         var thisBlock = document.getElementById(id);
         thisBlock.classList.toggle("show");
         return false;
      }
   </script>
</head>

<body onLoad="initialize(); setCounty({$county});">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">
   <p/>
   <b>Protests &amp; events are happening all over the state.</b>&nbsp;
   See
   {if $county > 0 } in {/if}
   <select name="county" id="countySelector" onChange="newCounty();">
      <option value="0">state-wide</option>
      <option value="1">ALCONA</option>
      <option value="2">ALGER</option>
      <option value="3">ALLEGAN</option>
      <option value="4">ALPENA</option>
      <option value="5">ANTRIM</option>
      <option value="6">ARENAC</option>
      <option value="7">BARAGA</option>
      <option value="8">BARRY</option>
      <option value="9">BAY</option>
      <option value="10">BENZIE</option>
      <option value="11">BERRIEN</option>
      <option value="12">BRANCH</option>
      <option value="13">CALHOUN</option>
      <option value="14">CASS</option>
      <option value="15">CHARLEVOIX</option>
      <option value="16">CHEBOYGAN</option>
      <option value="17">CHIPPEWA</option>
      <option value="18">CLARE</option>
      <option value="19">CLINTON</option>
      <option value="20">CRAWFORD</option>
      <option value="21">DELTA</option>
      <option value="22">DICKINSON</option>
      <option value="23">EATON</option>
      <option value="24">EMMET</option>
      <option value="25">GENESEE</option>
      <option value="26">GLADWIN</option>
      <option value="27">GOGEBIC</option>
      <option value="28">GRAND TRAVERSE</option>
      <option value="29">GRATIOT</option>
      <option value="30">HILLSDALE</option>
      <option value="31">HOUGHTON</option>
      <option value="32">HURON</option>
      <option value="33">INGHAM</option>
      <option value="34">IONIA</option>
      <option value="35">IOSCO</option>
      <option value="36">IRON</option>
      <option value="37">ISABELLA</option>
      <option value="38">JACKSON</option>
      <option value="39">KALAMAZOO</option>
      <option value="40">KALKASKA</option>
      <option value="41">KENT</option>
      <option value="42">KEWEENAW</option>
      <option value="43">LAKE</option>
      <option value="44">LAPEER</option>
      <option value="45">LEELANAU</option>
      <option value="46">LENAWEE</option>
      <option value="47">LIVINGSTON</option>
      <option value="48">LUCE</option>
      <option value="49">MACKINAC</option>
      <option value="50">MACOMB</option>
      <option value="51">MANISTEE</option>
      <option value="52">MARQUETTE</option>
      <option value="53">MASON</option>
      <option value="54">MECOSTA</option>
      <option value="55">MENOMINEE</option>
      <option value="56">MIDLAND</option>
      <option value="57">MISSAUKEE</option>
      <option value="58">MONROE</option>
      <option value="59">MONTCALM</option>
      <option value="60">MONTMORENCY</option>
      <option value="61">MUSKEGON</option>
      <option value="62">NEWAYGO</option>
      <option value="63">OAKLAND</option>
      <option value="64">OCEANA</option>
      <option value="65">OGEMAW</option>
      <option value="66">ONTONAGON</option>
      <option value="67">OSCEOLA</option>
      <option value="68">OSCODA</option>
      <option value="69">OTSEGO</option>
      <option value="70">OTTAWA</option>
      <option value="71">PRESQUE ISLE</option>
      <option value="72">ROSCOMMON</option>
      <option value="73">SAGINAW</option>
      <option value="74">ST CLAIR</option>
      <option value="75">ST JOSEPH</option>
      <option value="76">SANILAC</option>
      <option value="77">SCHOOLCRAFT</option>
      <option value="78">SHIAWASSEE</option>
      <option value="79">TUSCOLA</option>
      <option value="80">VAN BUREN</option>
      <option value="81">WASHTENAW</option>
      <option value="82">WAYNE</option>
      <option value="83">WEXFORD</option>
   </select><br/>
   or select a different county, or state-wide.&nbsp;
   You can also <a href="#submitnew">submit new events</a> or corrections.

   <p>
      <i>
         <b>Disclaimer:</b>&nbsp; We do not sponsor, en&shy;dorse, or vet events.&nbsp;
         This list is aggregated from many sources (so duplicates might appear).&nbsp;
         Check the links before attending.&nbsp;
         All protests are in&shy;tended to be <b>peaceful</b> assem&shy;blies &mdash; but your safety is your
         re&shy;spon&shy;si&shy;bility.&nbsp;
         See the ACLU guide to <a href="https://www.aclu.org/know-your-rights/protesters-rights" target="_blank"
      >protesters' rights</a>.
      </i>
   </p>
   <p/>
   <!--
   if zip != 0
   (See also the
   <a href="https://midems.controlshift.app/local?filter%5Blocation%5D=zip" target="_blank"
   >events near you</a> sponsored by your state and county Democratic parties.)
   endif
   -->

   {foreach from=$protests item=protest}
   <p class="outdented">
      <b>{$protest['day']|shortDate}</b>&nbsp;&nbsp;
      {$protest['time']}&nbsp;&nbsp;
      <a href='#' onClick="return flipVisibility('ploop{$protest@index}');">{$protest['name']}</a>&nbsp;
      {$protest['ctyname']|showCounty}
      <br/>
      {$protest['location']}

   <div id="ploop{$protest@index}" class="protestPanel indented">
      <b>Contacts:</b> {$protest['organizer']}
      {$protest['emails']|emailLinks}&nbsp;
      {$protest['urls']|hyperLinks}&nbsp;
      {$protest['phones']|splitComma}<br/>
      {$protest['signup']|showWithPrefix:"<b>Signup:</b> "}<br/>
      {$protest['descr']|showWithPrefix:"<b>Description</b>: "}<br/>
      <b>Source/corrections:</b>
      <a href="{$protest['srcurl']}" target="_blank">{$protest['srcname']}</a>
      &nbsp;&nbsp;&nbsp;
      (UniqueId: {$protest['hashcode']})
   </div>
   <p/>
   {/foreach}

   {if $noMore}
   <p>
      <i>(At this time, we have no listings for protests in your county.&nbsp;
         Select a different county, or state-wide.)</i>
   </p>
   {/if}

   <p>
      &nbsp;<br/>
      &nbsp;<br/>
      &nbsp;<br/>
   <p/>

   <p id="submitnew">
      <b>Submitting new events.</b>&nbsp;
      We do not create the list of events; we simply
      merge the data from the organizations below.&nbsp;
      To add an event, click on one or more of <b>their</b> links
      (opens in a new tab):
   <ul>
      <!--
                     <li><a href="https://docs.google.com/forms/d/e/1FAIpQLSej4dyOSE3m7HE7WfBDgI8MznPO7VwQfrONnvsW2qAJ1JFWaw/viewform?usp=sharing"
                       target="_blank">MI-Resist</a>
      -->
      <li><a href="https://tockify.com/tkf2/submitEvent/52da8db339c443afab943a987fea5fe0"
             target="_blank">Michigan Resistance</a>
      <li><a href="https://tockify.com/mifreedomcoalition/pinboard" target="_blank"
      >Michigan Freedom Coalition</a>
      <li><a href="https://events.mivoter.org" target="_blank">MIvoter events</a>
         &nbsp;&nbsp;&nbsp;(especially for County Democratic Parties and clubs)
   </ul>
      <b>Correcting events.</b>&nbsp;
      If an event listing needs correction, first try to contact the "source" organization
      listed under the event.&nbsp; (Or you may be able to submit a 'new' event to them, and
      note that this is a correction for a previous entry.)
   <p/>
   If that fails, use the "Feedback" link below, and send us the "UniqueId" listed at
   the bottom of the event, the county name, and the corrected info (date, time, etc.)
   </p>

</div>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
