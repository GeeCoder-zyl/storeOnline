var city = [
	["北京市", "天津市", "上海市", "重庆市"],
	["广州市", "深圳市", "珠海市", "东莞市"],
	["南京市", "苏州市", "南通市", "常州市"],
	["湘西土家族苗族自治州", "张家界市", "长沙市", "株洲市"]
];
var district = [
	[
		["东城区", "西城区", "宣武区"],
		["和平区", "红桥区", "塘沽区"],
		["杨浦区", "徐汇区"],
		["万州区", "涪陵区"]
	],
	[
		["天河区", "海珠区", "白云区", "番禺区"],
		["南山区", "宝安区", "福田区"],
		["香洲区", "斗门区", "金湾区"],
		["东城区", "莞城区", "万江区"]
	],
	[
		['玄武区', '白下区', '秦淮区', '建邺区'],
		['沧浪区', '平江区', '金阊区', '虎丘区'],
		['崇川区', '港闸区', '海安县', '如东县'],
		['天宁区', '钟楼区', '新北区']
	],
	[
		['吉首市', '花垣县', '永顺县', '保靖县'],
		['永定区', '武陵源区', '官黎平区', '桑植县'],
		['天心区', '雨花区', '宁乡县', '岳麓区'],
		['醴陵市', '炎陵县', '茶陵县', '攸县']
	]
];

function getCity() {
	//获得省份下拉框的对象
	var sltProvince = document.forms[1].province;
	//获得城市下拉框的对象
	var sltCity = document.forms[1].city;
	//获得市区下拉框的对象
	var sltDistrict = document.forms[1].district;
	//得到对应省份的城市数组
	var provinceCity = city[sltProvince.selectedIndex - 1];
	//清空城市下拉框，仅留提示选项
	sltCity.length = 1;
	sltDistrict.length = 1;
	//将城市数组中的值填充到城市下拉框中
	for(var i = 0; i < provinceCity.length; i++) {
		sltCity[i + 1] = new Option(provinceCity[i], provinceCity[i]);
	}
}

function getDistrict() {
	var sltProvince = document.forms[1].province;
	//获得城市下拉框的对象
	var sltCity = document.forms[1].city;
	//获得市区下拉框的对象
	var sltDistrict = document.forms[1].district;
	//得到对应城市的市区数组
	var cityDistrict = district[sltProvince.selectedIndex - 1][sltCity.selectedIndex - 1];
	//清空城市下拉框，仅留提示选项
	sltDistrict.length = 1;
	//将市区数组中的值填充到市区下拉框中
	for(var i = 0; i < cityDistrict.length; i++) {
		sltDistrict[i + 1] = new Option(cityDistrict[i], cityDistrict[i]);
	}
}