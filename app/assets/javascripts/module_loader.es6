export default class ModuleLoader {
  constructor() {
    this.body = document.body;
    this.controller = this.body.getAttribute("data-controller");
    this.action = this.body.getAttribute("data-action");
  }

  exec(controller, action) {
    let module_path_items = [].slice.call(arguments);
    let module_path = module_path_items.join('/');

    // In order to remove throwing error on requiring non existed module
    // we are defining empty module, and for case when module has been defined before
    // will be used previous definition

    define(module_path, () => {});
    require(module_path);
  }

  load() {
    if (this.controller && this.action) {
      this.exec('common');
      this.exec(this.controller);
      this.exec(this.controller, this.action);
    }
  }
}
