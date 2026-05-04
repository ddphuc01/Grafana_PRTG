#!/bin/bash
# =============================================================
#  Setup script: Grafana + PRTG Datasource Plugin
# =============================================================

set -e

echo "📦 Tạo thư mục plugins..."
mkdir -p plugins provisioning/datasources

echo "⬇️  Clone plugin grafana-prtg..."
if [ ! -d "plugins/grafana-prtg" ]; then
  git clone https://github.com/neuralfraud/grafana-prtg.git plugins/grafana-prtg
  echo "✅ Plugin đã được tải về."
else
  echo "✅ Plugin đã tồn tại, bỏ qua."
fi

echo ""
echo "🚀 Khởi động Grafana..."
docker compose up -d

echo ""
echo "=============================================="
echo "✅ Grafana đang chạy tại: http://localhost:3000"
echo "   Username: admin"
echo "   Password: admin123"
echo ""
echo "⚠️  Nhớ cập nhật passhash trong:"
echo "   provisioning/datasources/prtg.yml"
echo "=============================================="
