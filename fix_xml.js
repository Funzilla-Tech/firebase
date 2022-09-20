const xmlParser = require("xml2json");
const formatXml = require("xml-formatter")
const fs = require('fs');

const path = process.argv[2];
const package = process.argv[3];

try {
	const data = fs.readFileSync(path, { encoding: 'utf8' });
	const xmlObj = xmlParser.toJson(data, {reversible: true, object: true});
	const packages = xmlObj['dependencies']['androidPackages']['androidPackage'];
	let updated = false;
	for (let i = 0; i < packages.length; i++) {
		if (packages[i].spec == package) {
			packages.splice(i, 1);
			updated = true;
			break;
		}
	}
	if (updated)
	{
		const stringifiedXmlObj = JSON.stringify(xmlObj);
		const finalXml = xmlParser.toXml(stringifiedXmlObj);
		fs.writeFile(path, formatXml(finalXml, {collapseContent: true}), function(err, result) {
			if (err) {
				console.log(`Error!!! ${path} not updated`);
			} else {
				console.log(`${path} updated successfully`);
			}
		});
	}
	else
	{
		console.log(`${path} is already fixed`);
	}
} catch (err) {
	console.log(err);
	process.exit(1);
}

