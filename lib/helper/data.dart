import 'package:flutternews/model/category_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> _category = new List<CategoryModel>();

  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.image =
      "https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixlib=rb-1.2."
          "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
  _category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.image =
      "https://images.unsplash.com/photo-1486572788966-cfd3df1f5b42?ixlib=rb-1.2."
          "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80";
  _category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.image =
      "https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixlib=rb-1.2."
          "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
  _category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.image =
      "https://images.unsplash.com/photo-1463740839922-2d3b7e426a56?ixlib=rb-1.2."
          "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
  _category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.image =
      "https://images.unsplash.com/photo-1521587760476-6c12a4b040da?ixlib=rb-1.2."
          "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
  _category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sport";
  categoryModel.image =
      "https://images.unsplash.com/photo-1558365849-6ebd8b0454b2?ixlib=rb-1.2."
          "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
  _category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.image =
      "https://images.unsplash.com/photo-1504610926078-a1611febcad3?ixlib=rb-1.2."
          "1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
  _category.add(categoryModel);

  return _category;
}

List<NationModel> getNation(){

  List<NationModel> _nation = new List<NationModel>();

  NationModel nationModel = new NationModel();

  nationModel = new NationModel();
  nationModel.id = "ar";
  nationModel.nationName = "Argentina";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_ar-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "au";
  nationModel.nationName = "Australia";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_au-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "at";
  nationModel.nationName = "Austria";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_at-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "be";
  nationModel.nationName = "Belgia";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_be-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "br";
  nationModel.nationName = "Brazil";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_br-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "bg";
  nationModel.nationName = "Bulgaria";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_bu-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "ca";
  nationModel.nationName = "Canada";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_ca-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "cn";
  nationModel.nationName = "China";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_ch-flag.gif";
  _nation.add(nationModel);


  nationModel = new NationModel();
  nationModel.id = "co";
  nationModel.nationName = "Colombia";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_co-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "Cu";
  nationModel.nationName = "Cuba";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_cu-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "cz";
  nationModel.nationName = "Czech Republic";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_ez-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "eg";
  nationModel.nationName = "Egypt";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_eg-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "fr";
  nationModel.nationName = "France";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_fr-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "de";
  nationModel.nationName = "Germany";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_gm-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "gr";
  nationModel.nationName = "Greece";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_gr-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "hu";
  nationModel.nationName = "Hungary";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_hu-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "in";
  nationModel.nationName = "India";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_in-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "id";
  nationModel.nationName = "Indonesia";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_id-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "ie";
  nationModel.nationName = "Ireland";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_ei-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "it";
  nationModel.nationName = "Italy";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_it-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "jp";
  nationModel.nationName = "Japan";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_ja-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "my";
  nationModel.nationName = "Malaysia";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_my-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "ph";
  nationModel.nationName = "Philippines";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_rp-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "ru";
  nationModel.nationName = "Russia";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_rs-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "sa";
  nationModel.nationName = "Saudi Arabia";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_sa-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "sg";
  nationModel.nationName = "Singapore";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_sn-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "kr";
  nationModel.nationName = "South Korea";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_ks-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "tr";
  nationModel.nationName = "Turkey";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_tu-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "gb";
  nationModel.nationName = "United Kingdom";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_uk-flag.gif";
  _nation.add(nationModel);

  nationModel = new NationModel();
  nationModel.id = "us";
  nationModel.nationName = "United States";
  nationModel.image = "https://www.worldometers.info/img/flags/small/tn_us-flag.gif";
  _nation.add(nationModel);

  return _nation;

}
