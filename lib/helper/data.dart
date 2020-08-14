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
