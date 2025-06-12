import { ExecArgs } from "@medusajs/framework/types"

export default async function seed({ container }: ExecArgs) {
  // productService modülünü çözümle
  const productService = container.resolve("productService") as any

  // Örnek ürün verisi
  const productData = {
    title: "Örnek Ürün",
    description: "Seed ile eklenen örnek ürün.",
    handle: "ornek-urun",
    status: "published",
    type: { value: "default" },
    variants: [
      {
        title: "Standart",
        sku: "ORNEK-001",
        prices: [
          {
            currency_code: "try",
            amount: 10000,
          },
        ],
        inventory_quantity: 100,
      },
    ],
  }

  // Ürünü oluştur
  const product = await productService.create(productData)

  console.log(`Seed işlemi tamamlandı. Eklenen ürün: ${product.title}`)
} 