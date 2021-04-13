import Ember from 'ember';

export default Ember.Controller.extend(
  {
    actions: {
      createMenuItem: function () {
        let name = this.get('name');
        let price = this.get('price');
        let description = this.get('description');
        let menu_item = this.store.createRecord("menu_item", {
          name: name,
          price: price,
          description: description
        }
        );
        menu_item.save();
      },
      deleteMenuItem: function (params) {
        console.log(params);
        let this1 = this;
        this.store.findRecord('menu_item', params, { backgroundReload: false }).then(function (menu_item) {
          menu_item.deleteRecord();
          menu_item.get('isDeleted');
          menu_item.save();
        }
        );
      }
    }
  }
);
