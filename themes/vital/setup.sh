#!/bin/bash

# ============================================
# VITAL THEME — Setup Script
# ============================================

set -e

REPO="https://raw.githubusercontent.com/your-org/design-system/main"
THEME="vital"

echo ""
echo "Setting up Vital theme..."
echo ""

# 1. Install shadcn
echo "→ Initialising shadcn..."
npx shadcn@latest init --defaults

# 2. Install components
echo "→ Installing shadcn components..."
npx shadcn@latest add button card input badge table dialog --overwrite

# 3. Create docs folder and copy design files
echo "→ Copying design system files..."
mkdir -p docs
curl -s "$REPO/core/PRINCIPLES.md" -o docs/PRINCIPLES.md
curl -s "$REPO/themes/$THEME/DESIGN.md" -o docs/DESIGN.md
curl -s "$REPO/themes/$THEME/CLAUDE.md" -o CLAUDE.md

# 4. Replace globals.css
echo "→ Applying theme tokens..."
curl -s "$REPO/themes/$THEME/globals.css" -o src/app/globals.css

# 5. Patch layout.tsx to add Quicksand
echo "→ Configuring Quicksand font..."
cat > src/app/layout.tsx << 'LAYOUT'
import type { Metadata } from "next"
import { Quicksand } from "next/font/google"
import "./globals.css"

const quicksand = Quicksand({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  variable: "--font-quicksand",
})

export const metadata: Metadata = {
  title: "My Prototype",
  description: "",
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={`${quicksand.variable} antialiased`}>
        {children}
      </body>
    </html>
  )
}
LAYOUT

echo ""
echo "Vital theme ready."
echo "Run: claude"
echo ""
