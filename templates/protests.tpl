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
   <script type="module" src="address-search03.js"></script>

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

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
   {$ui->get('pg-protests-1')}

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
   </select>

   {$ui->get('pg-protests-2')}

   {foreach from=$protests item=protest}
   <p class="outdented">
      <b>{$protest['day']|shortDate}</b>&nbsp;&nbsp;
      {$protest['time']|escape}&nbsp;&nbsp;
      <a href='#' onClick="return flipVisibility('ploop{$protest@index}');">{$protest['name']|escape}</a>&nbsp;
      {$protest['ctyname']|showCounty}
      <br/>
      {$protest['location']|escape}

   <div id="ploop{$protest@index}" class="protestPanel indented">
      <b>Contacts:</b> {$protest['organizer']|escape}
      {$protest['emails']|emailLinks}&nbsp;
      {$protest['urls']|hyperLinks}&nbsp;
      {$protest['phones']|splitComma|escape}<br/>
      {$protest['signup']|escape|showWithPrefix:"<b>Signup:</b> "}<br/>
      {$protest['descr']|escape|showWithPrefix:"<b>Description</b>: "}<br/>
      <b>Source/corrections:</b>
      <a href="{$protest['srcurl']}"
                    target="_blank"
      >{$protest['srcname']|escape}</a>
      &nbsp;&nbsp;&nbsp;
      (UniqueId: {$protest['hashcode']|escape})
   </div>
   <p/>
   {/foreach}

   <p>
      &nbsp;<br/>
      &nbsp;<br/>
      &nbsp;<br/>
   <p/>

   <p id="submitnew">
      {$ui->get('pg-protests-4')}
   </p>

</div>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
