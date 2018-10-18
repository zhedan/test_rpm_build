NAME=test_rpm_build

RPM_FILE=$(basename $(ls $NAME-*.rpm))
PKG=${RPM_FILE%.rpm}
if rpm -qi $PKG; then
  rpm -e --nodeps $PKG || exit 1
fi

yum -y install $RPM_FILE || exit 1

ls -R1 /usr/lib/python2.7/site-packages/$NAME/
