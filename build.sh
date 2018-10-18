CUR_DIR=$(cd $(dirname $0) && pwd)

RPM_BUILD_ROOT=/root/rpmbuild
NAME=test_rpm_build

rm -rf $RPM_BUILD_ROOT

function init_rpmbuild_dirs(){
  mkdir -p $RPM_BUILD_ROOT
  pushd $RPM_BUILD_ROOT
  mkdir -p BUILD
  mkdir -p BUILDROOT
  mkdir -p SPECS
  mkdir -p SOURCES
  mkdir -p RPMS
  mkdir -p SRCRPMS
  popd
}

init_rpmbuild_dirs

rm -rf $RPM_BUILD_ROOT/BUILD/$(basename $CUR_DIR)
cp -r $CUR_DIR/ $RPM_BUILD_ROOT/BUILD || exit 1
cp $CUR_DIR/$NAME.spec $RPM_BUILD_ROOT/SPECS || exit 1

rpmbuild -vv -bb $RPM_BUILD_ROOT/SPECS/$NAME.spec || exit 1

cp $RPM_BUILD_ROOT/RPMS/noarch/$NAME*.rpm $CUR_DIR/ || exit 1

