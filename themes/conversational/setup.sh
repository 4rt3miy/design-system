#!/bin/bash

# ============================================
# CONVERSATIONAL THEME — Setup Script
# ============================================

set -e

REPO="https://raw.githubusercontent.com/your-org/design-system/main"
THEME="conversational"

echo ""
echo "Setting up Conversational theme..."
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

# 5. Patch layout.tsx to add Crimson Pro
echo "→ Configuring Crimson Pro font..."
cat > src/app/layout.tsx << 'LAYOUT'
import type { Metadata } from "next"
import { Crimson_Pro } from "next/font/google"
import "./globals.css"

const crimsonPro = Crimson_Pro({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  variable: "--font-crimson",
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
      <body className={`${crimsonPro.variable} antialiased`}>
        {children}
      </body>
    </html>
  )
}
LAYOUT

echo ""
echo "Conversational theme ready."
echo "Run: claude"
echo ""
