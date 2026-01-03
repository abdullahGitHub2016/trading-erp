import ProductController from './ProductController'
import Admin from './Admin'
import Settings from './Settings'
const Controllers = {
    ProductController: Object.assign(ProductController, ProductController),
Admin: Object.assign(Admin, Admin),
Settings: Object.assign(Settings, Settings),
}

export default Controllers